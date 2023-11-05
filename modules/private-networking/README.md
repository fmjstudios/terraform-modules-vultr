# Terraform Module <img src="../resources/assets/vendor/terraform/Terraform_VerticalLogo_ColorWhite_RGB.png" width="200" align="right" />

## Vultr Virtual Private Cloud

This module manages VPC networks hosted by _Vultr Inc_.

---

## 🚧 Usage

```hcl

module "vultr_vpc" {
  source = "./modules/vultr-private-networking"

  description = "Virtual private network for infrastructure testing"
  cidr_block  = "10.0.0.0/24"
}

```

---

### 📜 License

**[Proprietary](./LICENSE)**

### ✉ Contact

- **Admin**: Maximilian Gindorfer
- **E-Mail**: [maximilian.gindorfer@delta4x4.com](mailto:maximilian.gindorfer@delta4x4.com)
- **Mobile**: +49 8134 93020

### © Copyright

_Assets provided by:_ **[Design Barn Inc.](https://iconscout.com)**
