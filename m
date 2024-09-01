Return-Path: <linux-kbuild+bounces-3307-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7B2967734
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Sep 2024 17:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B58731C20AA9
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Sep 2024 15:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A63D2C19E;
	Sun,  1 Sep 2024 15:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vH+sanxO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B05F26AEA;
	Sun,  1 Sep 2024 15:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725204876; cv=none; b=ZYx6cV1skN3q0cucibE70N+wqtp7gfrNX7P7HXdTRouWJywNdk8ZHHqzoENjZIVGF0OauZvIEk4aB/Kn6TBG9Jjc0OQNRXCS9x4UR2+XhRbvtnEukNKPZRq0oWwj1OCNdFcLH79fNJ4/78aTYQikZX1eixKl8q7/aIyFRRjCwgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725204876; c=relaxed/simple;
	bh=FgsG1NQYh7lM/TTNC+liIO6CqYLNB2/Cqer/okDSwjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kb3+mM20+wsb/KoTaxoPehQXcDtLulQNxts+XoqL13bvtETARQCxeCCMJloZUkHnNn5FAxgf6D6durcrm5HjFzcte79xOX/Ceu/AhfiXQBsfvTPi5PJAKUrSHhUHy42gS+gL17E9jI0ZoKjvnNZQL7AHvHwCoeD6cQor27HYFIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vH+sanxO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC01CC4CEC9;
	Sun,  1 Sep 2024 15:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725204875;
	bh=FgsG1NQYh7lM/TTNC+liIO6CqYLNB2/Cqer/okDSwjg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vH+sanxO8ckaQspNHtaq0iVtt7yauHTMoA6UyNVE2v2d25lISxXygqInQOwItkEKt
	 uSEOkQ+7Sxp4ytCA1jwgzTbPFMIvaaM54k7Su4p92rYByGGcYM8PZuUv+4veMoM06p
	 YPwQ/G7jIgt0rHYugWU4xDo/4aJdivClZUKzbpqfMG1P1/foir/khdtHYAJ+Wu4m7u
	 OZg4SOdE3lrisKUz94OXkXOWuS4Oo0X4UJDGXHdkZdeIfSO+2llS+yIELQBfCvWH4u
	 AQS4hA5hERymOHm7sE5DhIXq7AypuLLbHOIQV7N49qm61QoU5jfLSV2+5d/Mqpb5+I
	 nmwstgn11fYpA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f51b67e16dso38057531fa.3;
        Sun, 01 Sep 2024 08:34:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWuPWeMvYAqITqVoi8e9yXus+WAzROujoRH1uSDqcp3sYedqiibJG5P6j/6jyFDBvNYZte3heJ+FdOq0RM=@vger.kernel.org, AJvYcCXCZSNo5TSwWEs2jxd/0tyH4eo8AmuT80Pgwpuxi8QQb2hpmquUoMaphdsd/qgx+k6z+z7uGOQscEnvo+UO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcvnv2RQI4TkT0jt6pWZcbQhg26mNcpvc0w9JXa7JE2Jb0Kfew
	lLEJy+GskyVSjtNqLAMsLMj/qNuheFw1phCCm4byxg3pbE1Kg7bV9886k2XE1djea4rjR255M3B
	AR2QffJPEHMuEfwMbc6RNYdgNz2w=
X-Google-Smtp-Source: AGHT+IFAFqy44nVqodqMurZA+hHCssh6rsaWP3AL6HPR1Is7U1vqYHemEX12i+MfXUhaDcZZKin/uebQf/sEcOjARao=
X-Received: by 2002:a05:6512:a8e:b0:533:4642:9e06 with SMTP id
 2adb3069b0e04-53546b59d4bmr4749805e87.34.1725204874301; Sun, 01 Sep 2024
 08:34:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240824-modinfo-const-v1-1-485f9c64b868@weissschuh.net>
In-Reply-To: <20240824-modinfo-const-v1-1-485f9c64b868@weissschuh.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 2 Sep 2024 00:33:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNASbuJcgFBz+_4gJMnTvVeyeCbu2ZwGEu+ofj+kLKF9wiw@mail.gmail.com>
Message-ID: <CAK7LNASbuJcgFBz+_4gJMnTvVeyeCbu2ZwGEu+ofj+kLKF9wiw@mail.gmail.com>
Subject: Re: [PATCH RFC] modpost: compile constant module information only once
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000b372cd0621108f9a"

--000000000000b372cd0621108f9a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 25, 2024 at 2:44=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> Various information about modules is compiled into the info sections.
> For that a dedicated .mod.c file is generated by modpost for each module
> and then linked into the module.
> However most of the information in the .mod.c is the same for all
> modules, internal and external.
> Split the shared information into a dedicated source file that is
> compiled once and then linked into all modules.
>
> This avoids frequent rebuilds for all .mod.c files when using
> CONFIG_LOCALVERSION_AUTO because the local version ends up in .mod.c
> through UTS_RELEASE and VERMAGIC_STRING.
> The modules are still relinked in this case.
>
> The code is also easier to maintain as it's now in a proper source file
> instead of an inline string literal.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
> I came up with this while investigating something different.
> Not sure it's worth the effort.
> ---
>  scripts/Makefile.modfinal            |  9 +++++++--
>  scripts/mod/modinfo.c                | 25 +++++++++++++++++++++++++
>  scripts/mod/modpost.c                | 23 -----------------------
>  scripts/package/install-extmod-build |  3 ++-
>  4 files changed, 34 insertions(+), 26 deletions(-)
>
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 306a6bb86e4d..dde09dc4ba11 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -30,6 +30,11 @@ quiet_cmd_cc_o_c =3D CC [M]  $@
>  %.mod.o: %.mod.c FORCE
>         $(call if_changed_dep,cc_o_c)
>
> +ifeq ($(KBUILD_EXTMOD),)
> +scripts/mod/modinfo.o: scripts/mod/modinfo.c FORCE
> +       $(call if_changed_dep,cc_o_c)
> +endif
> +
>  quiet_cmd_ld_ko_o =3D LD [M]  $@
>        cmd_ld_ko_o +=3D                                                  =
 \
>         $(LD) -r $(KBUILD_LDFLAGS)                                      \
> @@ -54,13 +59,13 @@ if_changed_except =3D $(if $(call newer_prereqs_excep=
t,$(2))$(cmd-check),      \
>         printf '%s\n' 'savedcmd_$@ :=3D $(make-cmd)' > $(dot-target).cmd,=
 @:)
>
>  # Re-generate module BTFs if either module's .ko or vmlinux changed
> -%.ko: %.o %.mod.o scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODUL=
ES),$(KBUILD_BUILTIN),vmlinux) FORCE
> +%.ko: %.o %.mod.o scripts/module.lds scripts/mod/modinfo.o $(and $(CONFI=
G_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),vmlinux) FORCE
>         +$(call if_changed_except,ld_ko_o,vmlinux)
>  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
>         +$(if $(newer-prereqs),$(call cmd,btf_ko))
>  endif
>
> -targets +=3D $(modules:%.o=3D%.ko) $(modules:%.o=3D%.mod.o)
> +targets +=3D $(modules:%.o=3D%.ko) $(modules:%.o=3D%.mod.o) scripts/mod/=
modinfo.o
>
>  # Add FORCE to the prerequisites of a target to force it to be always re=
built.
>  # ----------------------------------------------------------------------=
-----
> diff --git a/scripts/mod/modinfo.c b/scripts/mod/modinfo.c
> new file mode 100644
> index 000000000000..12fbc6d3aae8
> --- /dev/null
> +++ b/scripts/mod/modinfo.c
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/module.h>
> +/*
> + * Include build-salt.h after module.h in order to
> + * inherit the definitions.
> + */
> +#define INCLUDE_VERMAGIC
> +#include <linux/build-salt.h>
> +#include <linux/elfnote-lto.h>
> +#include <linux/vermagic.h>
> +
> +#ifdef CONFIG_UNWINDER_ORC
> +#include <asm/orc_header.h>
> +ORC_HEADER;
> +#endif
> +
> +BUILD_SALT;
> +BUILD_LTO_INFO;
> +
> +MODULE_INFO(vermagic, VERMAGIC_STRING);
> +
> +#ifdef CONFIG_MITIGATION_RETPOLINE
> +MODULE_INFO(retpoline, "Y");
> +#endif
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index c8cd5d822bb6..107393a8c48a 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1755,26 +1755,9 @@ static void check_modname_len(struct module *mod)
>  static void add_header(struct buffer *b, struct module *mod)
>  {
>         buf_printf(b, "#include <linux/module.h>\n");
> -       /*
> -        * Include build-salt.h after module.h in order to
> -        * inherit the definitions.
> -        */
> -       buf_printf(b, "#define INCLUDE_VERMAGIC\n");
> -       buf_printf(b, "#include <linux/build-salt.h>\n");
> -       buf_printf(b, "#include <linux/elfnote-lto.h>\n");
>         buf_printf(b, "#include <linux/export-internal.h>\n");
> -       buf_printf(b, "#include <linux/vermagic.h>\n");
>         buf_printf(b, "#include <linux/compiler.h>\n");
>         buf_printf(b, "\n");
> -       buf_printf(b, "#ifdef CONFIG_UNWINDER_ORC\n");
> -       buf_printf(b, "#include <asm/orc_header.h>\n");
> -       buf_printf(b, "ORC_HEADER;\n");
> -       buf_printf(b, "#endif\n");
> -       buf_printf(b, "\n");
> -       buf_printf(b, "BUILD_SALT;\n");
> -       buf_printf(b, "BUILD_LTO_INFO;\n");
> -       buf_printf(b, "\n");
> -       buf_printf(b, "MODULE_INFO(vermagic, VERMAGIC_STRING);\n");
>         buf_printf(b, "MODULE_INFO(name, KBUILD_MODNAME);\n");
>         buf_printf(b, "\n");
>         buf_printf(b, "__visible struct module __this_module\n");
> @@ -1792,12 +1775,6 @@ static void add_header(struct buffer *b, struct mo=
dule *mod)
>         if (!external_module)
>                 buf_printf(b, "\nMODULE_INFO(intree, \"Y\");\n");
>
> -       buf_printf(b,
> -                  "\n"
> -                  "#ifdef CONFIG_MITIGATION_RETPOLINE\n"
> -                  "MODULE_INFO(retpoline, \"Y\");\n"
> -                  "#endif\n");
> -
>         if (strstarts(mod->name, "drivers/staging"))
>                 buf_printf(b, "\nMODULE_INFO(staging, \"Y\");\n");
>
> diff --git a/scripts/package/install-extmod-build b/scripts/package/insta=
ll-extmod-build
> index d2c9cacecc0c..15fab6d5dd56 100755
> --- a/scripts/package/install-extmod-build
> +++ b/scripts/package/install-extmod-build
> @@ -37,6 +37,7 @@ mkdir -p "${destdir}"
>         echo include/config/auto.conf
>         echo include/config/kernel.release
>         echo include/generated
> +       echo scripts/mod/modinfo.o
>         find_in_scripts
>
>         if is_enabled CONFIG_GCC_PLUGINS; then
> @@ -78,4 +79,4 @@ if [ "${CC}" !=3D "${HOSTCC}" ] && is_enabled CONFIG_CC=
_CAN_LINK; then
>         rm -f "${destdir}/Kbuild" "${destdir}/scripts/Kbuild"
>  fi
>
> -find "${destdir}" \( -name '.*.cmd' -o -name '*.o' \) -delete
> +find "${destdir}" \( -name '.*.cmd' -o \( -name '*.o' -a -! -path '*/scr=
ipts/mod/modinfo.o' \) \) -delete


This is not an enough hack because scripts/mod/modinfo.o
is a new requirement for building external modules.

'make clean' would need a similar treatment.

'make help' goes:

  clean   - Remove most generated files but keep the config and
            enough build support to build external modules






Or, another approach is to generate a different object
when building external modules.

A patch attached (on top of this).





>
> ---
> base-commit: 184a282d540c3da03f6a229f4792a5f72d3dfc2a
> change-id: 20240824-modinfo-const-6f0d67e2b301
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>


--=20
Best Regards
Masahiro Yamada

--000000000000b372cd0621108f9a
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-fix.patch"
Content-Disposition: attachment; filename="0001-fix.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m0jqe27w0>
X-Attachment-Id: f_m0jqe27w0

RnJvbSBjMTdmMTBlZGNlYmNiOGE5YjY2MzQzODA4Mjk2NDg1YTRmMTRhY2EwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3Jn
PgpEYXRlOiBTdW4sIDEgU2VwIDIwMjQgMjE6MjI6MjggKzA5MDAKU3ViamVjdDogW1BBVENIXSBm
aXgKClNpZ25lZC1vZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+
Ci0tLQogc2NyaXB0cy9NYWtlZmlsZS5tb2RmaW5hbCAgICAgICAgICAgICAgICAgIHwgOCArKyst
LS0tLQogc2NyaXB0cy97bW9kL21vZGluZm8uYyA9PiBtb2R1bGUtY29tbW9uLmN9IHwgMAogc2Ny
aXB0cy9wYWNrYWdlL2luc3RhbGwtZXh0bW9kLWJ1aWxkICAgICAgIHwgMyArLS0KIDMgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQogcmVuYW1lIHNjcmlwdHMv
e21vZC9tb2RpbmZvLmMgPT4gbW9kdWxlLWNvbW1vbi5jfSAoMTAwJSkKCmRpZmYgLS1naXQgYS9z
Y3JpcHRzL01ha2VmaWxlLm1vZGZpbmFsIGIvc2NyaXB0cy9NYWtlZmlsZS5tb2RmaW5hbAppbmRl
eCBkZGUwOWRjNGJhMTEuLjZjMzExMmZiM2Q5MiAxMDA2NDQKLS0tIGEvc2NyaXB0cy9NYWtlZmls
ZS5tb2RmaW5hbAorKysgYi9zY3JpcHRzL01ha2VmaWxlLm1vZGZpbmFsCkBAIC0zMCwxMCArMzAs
OCBAQCBxdWlldF9jbWRfY2Nfb19jID0gQ0MgW01dICAkQAogJS5tb2QubzogJS5tb2QuYyBGT1JD
RQogCSQoY2FsbCBpZl9jaGFuZ2VkX2RlcCxjY19vX2MpCiAKLWlmZXEgKCQoS0JVSUxEX0VYVE1P
RCksKQotc2NyaXB0cy9tb2QvbW9kaW5mby5vOiBzY3JpcHRzL21vZC9tb2RpbmZvLmMgRk9SQ0UK
KyQoZXh0bW9kX3ByZWZpeCkubW9kdWxlLWNvbW1vbi5vOiAkKHNyY3RyZWUpL3NjcmlwdHMvbW9k
dWxlLWNvbW1vbi5jIEZPUkNFCiAJJChjYWxsIGlmX2NoYW5nZWRfZGVwLGNjX29fYykKLWVuZGlm
CiAKIHF1aWV0X2NtZF9sZF9rb19vID0gTEQgW01dICAkQAogICAgICAgY21kX2xkX2tvX28gKz0J
CQkJCQkJXApAQCAtNTksMTMgKzU3LDEzIEBAIGlmX2NoYW5nZWRfZXhjZXB0ID0gJChpZiAkKGNh
bGwgbmV3ZXJfcHJlcmVxc19leGNlcHQsJCgyKSkkKGNtZC1jaGVjayksICAgICAgXAogCXByaW50
ZiAnJXNcbicgJ3NhdmVkY21kXyRAIDo9ICQobWFrZS1jbWQpJyA+ICQoZG90LXRhcmdldCkuY21k
LCBAOikKIAogIyBSZS1nZW5lcmF0ZSBtb2R1bGUgQlRGcyBpZiBlaXRoZXIgbW9kdWxlJ3MgLmtv
IG9yIHZtbGludXggY2hhbmdlZAotJS5rbzogJS5vICUubW9kLm8gc2NyaXB0cy9tb2R1bGUubGRz
IHNjcmlwdHMvbW9kL21vZGluZm8ubyAkKGFuZCAkKENPTkZJR19ERUJVR19JTkZPX0JURl9NT0RV
TEVTKSwkKEtCVUlMRF9CVUlMVElOKSx2bWxpbnV4KSBGT1JDRQorJS5rbzogJS5vICUubW9kLm8g
JChleHRtb2RfcHJlZml4KS8ubW9kdWxlLWNvbW1vbi5vIHNjcmlwdHMvbW9kdWxlLmxkcyAkKGFu
ZCAkKENPTkZJR19ERUJVR19JTkZPX0JURl9NT0RVTEVTKSwkKEtCVUlMRF9CVUlMVElOKSx2bWxp
bnV4KSBGT1JDRQogCSskKGNhbGwgaWZfY2hhbmdlZF9leGNlcHQsbGRfa29fbyx2bWxpbnV4KQog
aWZkZWYgQ09ORklHX0RFQlVHX0lORk9fQlRGX01PRFVMRVMKIAkrJChpZiAkKG5ld2VyLXByZXJl
cXMpLCQoY2FsbCBjbWQsYnRmX2tvKSkKIGVuZGlmCiAKLXRhcmdldHMgKz0gJChtb2R1bGVzOiUu
bz0lLmtvKSAkKG1vZHVsZXM6JS5vPSUubW9kLm8pIHNjcmlwdHMvbW9kL21vZGluZm8ubwordGFy
Z2V0cyArPSAkKG1vZHVsZXM6JS5vPSUua28pICQobW9kdWxlczolLm89JS5tb2QubykgJChleHRt
b2RfcHJlZml4KS5tb2R1bGUtY29tbW9uLm8KIAogIyBBZGQgRk9SQ0UgdG8gdGhlIHByZXJlcXVp
c2l0ZXMgb2YgYSB0YXJnZXQgdG8gZm9yY2UgaXQgdG8gYmUgYWx3YXlzIHJlYnVpbHQuCiAjIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9tb2QvbW9kaW5mby5jIGIvc2Ny
aXB0cy9tb2R1bGUtY29tbW9uLmMKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIHNj
cmlwdHMvbW9kL21vZGluZm8uYwpyZW5hbWUgdG8gc2NyaXB0cy9tb2R1bGUtY29tbW9uLmMKZGlm
ZiAtLWdpdCBhL3NjcmlwdHMvcGFja2FnZS9pbnN0YWxsLWV4dG1vZC1idWlsZCBiL3NjcmlwdHMv
cGFja2FnZS9pbnN0YWxsLWV4dG1vZC1idWlsZAppbmRleCAxNWZhYjZkNWRkNTYuLmQyYzljYWNl
Y2MwYyAxMDA3NTUKLS0tIGEvc2NyaXB0cy9wYWNrYWdlL2luc3RhbGwtZXh0bW9kLWJ1aWxkCisr
KyBiL3NjcmlwdHMvcGFja2FnZS9pbnN0YWxsLWV4dG1vZC1idWlsZApAQCAtMzcsNyArMzcsNiBA
QCBta2RpciAtcCAiJHtkZXN0ZGlyfSIKIAllY2hvIGluY2x1ZGUvY29uZmlnL2F1dG8uY29uZgog
CWVjaG8gaW5jbHVkZS9jb25maWcva2VybmVsLnJlbGVhc2UKIAllY2hvIGluY2x1ZGUvZ2VuZXJh
dGVkCi0JZWNobyBzY3JpcHRzL21vZC9tb2RpbmZvLm8KIAlmaW5kX2luX3NjcmlwdHMKIAogCWlm
IGlzX2VuYWJsZWQgQ09ORklHX0dDQ19QTFVHSU5TOyB0aGVuCkBAIC03OSw0ICs3OCw0IEBAIGlm
IFsgIiR7Q0N9IiAhPSAiJHtIT1NUQ0N9IiBdICYmIGlzX2VuYWJsZWQgQ09ORklHX0NDX0NBTl9M
SU5LOyB0aGVuCiAJcm0gLWYgIiR7ZGVzdGRpcn0vS2J1aWxkIiAiJHtkZXN0ZGlyfS9zY3JpcHRz
L0tidWlsZCIKIGZpCiAKLWZpbmQgIiR7ZGVzdGRpcn0iIFwoIC1uYW1lICcuKi5jbWQnIC1vIFwo
IC1uYW1lICcqLm8nIC1hIC0hIC1wYXRoICcqL3NjcmlwdHMvbW9kL21vZGluZm8ubycgXCkgXCkg
LWRlbGV0ZQorZmluZCAiJHtkZXN0ZGlyfSIgXCggLW5hbWUgJy4qLmNtZCcgLW8gLW5hbWUgJyou
bycgXCkgLWRlbGV0ZQotLSAKMi40My4wCgo=
--000000000000b372cd0621108f9a--

