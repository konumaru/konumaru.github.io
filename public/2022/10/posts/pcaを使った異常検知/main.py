import matplotlib.pyplot as plt
import numpy as np
from pyod.utils.data import generate_data
from sklearn import metrics
from sklearn.decomposition import PCA

# NOTE: 前提として、訓練データに異常標本が混ざっており、教示データを用意できないこととする


def fit_and_inverse(data: np.ndarray, n_components: int = 2):
    pca = PCA(n_components=n_components)
    reduced = pca.fit_transform(data)
    inverse = pca.inverse_transform(reduced)
    return inverse


def main():
    X_train, _, y_train, _ = generate_data(
        n_train=2000,
        n_test=0,
        contamination=0.1,  # percentage of outliers
        random_state=42,
    )

    print(X_train.shape)
    print(y_train.shape)

    plt.figure()
    plt.title("Plot generated features")
    plt.scatter(
        X_train[y_train == 0, 0],
        X_train[y_train == 0, 1],
        color="blue",
        label="normal",
    )
    plt.scatter(
        X_train[y_train == 1, 0],
        X_train[y_train == 1, 1],
        color="red",
        label="abnormal",
    )
    plt.xlabel("Feature 1")
    plt.ylabel("Feature 2")
    plt.tight_layout()
    plt.legend()
    plt.savefig("./data/plot_inputs.png")

    raw = X_train.copy()
    inv = fit_and_inverse(raw)
    mse = ((raw - inv) ** 2).mean(axis=1)

    threshold = np.percentile(mse, 90)

    plt.figure()
    plt.title("MSE Histgram")
    plt.hist(mse, bins=100)
    plt.vlines(
        (threshold, threshold),
        0,
        2000,
        color="red",
        linestyles="dashed",
        label=f"{threshold = }",
    )
    plt.xlabel("MSE")
    plt.tight_layout()
    plt.legend()
    plt.savefig("./data/mse_histgram.png")

    y_pred = (mse > threshold).astype(np.int8)
    cf_matrix = metrics.confusion_matrix(y_train, y_pred)
    cm_display = metrics.ConfusionMatrixDisplay(
        confusion_matrix=cf_matrix, display_labels=[False, True]
    )
    cm_display.plot(cmap="cividis")
    plt.title("Confusion Matrix")
    plt.savefig("./data/confusion_matrix.png")

    print("\n\n\n[ Classification Report ]\n")
    print(metrics.classification_report(y_train, y_pred))


if __name__ == "__main__":
    main()
