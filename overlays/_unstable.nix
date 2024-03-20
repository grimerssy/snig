{ unstable, ... }: self: super: {
  unstable = import unstable { system = super.system; };
}
