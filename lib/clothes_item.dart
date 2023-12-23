class ClothesItem {
    String? image;
    String? color;
    String? item;

    ClothesItem(String? image, String? color, String? item) {
        this.image = image;
        this.color = color;
        this.item = item;
    }

    ClothesItem.empty() {
        this.image = null;
        this.color = null;
        this.item = null;
    }
}