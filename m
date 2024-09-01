Return-Path: <linux-kbuild+bounces-3308-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B05B8967757
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Sep 2024 18:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB1721C20AC4
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Sep 2024 16:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3284183CBD;
	Sun,  1 Sep 2024 15:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOSe3sV/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EA1183CAB;
	Sun,  1 Sep 2024 15:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725206397; cv=none; b=OO4sx0y4NPHvegnCeakN9WygQd6/Iu63sMnrXkS7kMLl24CehaxBNLk3FWFwnT8vOHOoYIHOygLtte+8oylu8LEuqv5oMXm5Dine8iuLVVa9lKTo66QY2CNPGtysBILqGMsAJjm3Y+SXSINzWR/XgFH5kMEowR475LzozwFIB5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725206397; c=relaxed/simple;
	bh=aRl7N0xX7x76vgxP3KawIZsXQn0epvrr/XWYtFA7NF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uW+/mSdo8BG9a8c6cKdbJps6eFPGzONd42CDp8fjArHbxhqpn3OKVSQ9qzWHt3HhFDcqC/DNdx+cZ7lO7W52cajBiHBlg7i5mt0LCLwj70ERMj/55wy8qAA7/NzqLewLQAnJN2+F07niHi4F7cLUayaAWDyMcL09v7vyqjn/I8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aOSe3sV/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22289C4CEC8;
	Sun,  1 Sep 2024 15:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725206397;
	bh=aRl7N0xX7x76vgxP3KawIZsXQn0epvrr/XWYtFA7NF0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aOSe3sV/MQnDCnD9HMcnRIJkWFDYxDbwpzEONlQ5vreTQG7plQUfrQLmvPIihv7gx
	 sEY1kJr1Kt1G7yAwavqrI6RzP9pH5bW0rQI62pN3PVpXO62WVSt5k7SsSqpOVVpwlJ
	 4mHDwfIXFPQQL/rYu7Dc/CMG0u0t5hVU4wYcwx/KZy/6i1axFKxGHEVuLZdZilFkIL
	 A4AJd/jVPzrYQJDOW+leiS5PHButHiKrw3id0H/OZ1eR68sNq9U4X+D62Zp6ZY7Nhk
	 KeByqzHNDZ1cD8gwjUMKGIbC5G6s7+glZMuW1atk+XVxHqaEIuJ/wSt1OHMPe/QowG
	 rFwQT53XgRfAQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso5902951e87.0;
        Sun, 01 Sep 2024 08:59:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWuEeoN0Z5CwmOAxcjjyGhA4rby3G3pKCguPjOHWLydNMJpUeN/aMCNVWXZ4D5KrC9gM677DVDbhOix1OI=@vger.kernel.org, AJvYcCXFx28wYybm8Sy/cKiOIsJHLERLDjf3PuXo2YnwEd3pRdVUugQMU1BJql+09if7UwOebygiZekddsC2BYJI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2UjD7uyff+SrZIo7YQBcfWbyRhPB+YoGGNpkTMOfDzoptNH7Y
	DAdegdQKWp2izd4jROxVpkClxM81ndkGRfjAS+SAYX/Sf+IhYT5I4e0KBrfKtp7XResufT/Ddwc
	+4qtQeoFafPHsL/j4yQvqN5nPxNM=
X-Google-Smtp-Source: AGHT+IFb0fGNTo/8kgyfvzqPjo2AWcx5Kl0+arxvMT/aHFjit8HwKDFXchOQJ8eUr52sVFDc640E+Yko9VmF+FRTePE=
X-Received: by 2002:a05:6512:3052:b0:533:4522:7409 with SMTP id
 2adb3069b0e04-53546ba8f5cmr4566409e87.53.1725206395695; Sun, 01 Sep 2024
 08:59:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240824-modinfo-const-v1-1-485f9c64b868@weissschuh.net> <CAK7LNASbuJcgFBz+_4gJMnTvVeyeCbu2ZwGEu+ofj+kLKF9wiw@mail.gmail.com>
In-Reply-To: <CAK7LNASbuJcgFBz+_4gJMnTvVeyeCbu2ZwGEu+ofj+kLKF9wiw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 2 Sep 2024 00:59:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNATqSKwvKYMVJDLhXx5xEexrLAaA3O742LmHu_CH0dbzWQ@mail.gmail.com>
Message-ID: <CAK7LNATqSKwvKYMVJDLhXx5xEexrLAaA3O742LmHu_CH0dbzWQ@mail.gmail.com>
Subject: Re: [PATCH RFC] modpost: compile constant module information only once
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000061ad4c062110ea16"

--00000000000061ad4c062110ea16
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 12:33=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Sun, Aug 25, 2024 at 2:44=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weis=
sschuh.net> wrote:
> >
> > Various information about modules is compiled into the info sections.
> > For that a dedicated .mod.c file is generated by modpost for each modul=
e
> > and then linked into the module.
> > However most of the information in the .mod.c is the same for all
> > modules, internal and external.
> > Split the shared information into a dedicated source file that is
> > compiled once and then linked into all modules.
> >
> > This avoids frequent rebuilds for all .mod.c files when using
> > CONFIG_LOCALVERSION_AUTO because the local version ends up in .mod.c
> > through UTS_RELEASE and VERMAGIC_STRING.
> > The modules are still relinked in this case.
> >
> > The code is also easier to maintain as it's now in a proper source file
> > instead of an inline string literal.
> >
> > Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > ---
> > I came up with this while investigating something different.
> > Not sure it's worth the effort.
> > ---
> >  scripts/Makefile.modfinal            |  9 +++++++--
> >  scripts/mod/modinfo.c                | 25 +++++++++++++++++++++++++
> >  scripts/mod/modpost.c                | 23 -----------------------
> >  scripts/package/install-extmod-build |  3 ++-
> >  4 files changed, 34 insertions(+), 26 deletions(-)
> >
> > diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> > index 306a6bb86e4d..dde09dc4ba11 100644
> > --- a/scripts/Makefile.modfinal
> > +++ b/scripts/Makefile.modfinal
> > @@ -30,6 +30,11 @@ quiet_cmd_cc_o_c =3D CC [M]  $@
> >  %.mod.o: %.mod.c FORCE
> >         $(call if_changed_dep,cc_o_c)
> >
> > +ifeq ($(KBUILD_EXTMOD),)
> > +scripts/mod/modinfo.o: scripts/mod/modinfo.c FORCE
> > +       $(call if_changed_dep,cc_o_c)
> > +endif
> > +
> >  quiet_cmd_ld_ko_o =3D LD [M]  $@
> >        cmd_ld_ko_o +=3D                                                =
   \
> >         $(LD) -r $(KBUILD_LDFLAGS)                                     =
 \
> > @@ -54,13 +59,13 @@ if_changed_except =3D $(if $(call newer_prereqs_exc=
ept,$(2))$(cmd-check),      \
> >         printf '%s\n' 'savedcmd_$@ :=3D $(make-cmd)' > $(dot-target).cm=
d, @:)
> >
> >  # Re-generate module BTFs if either module's .ko or vmlinux changed
> > -%.ko: %.o %.mod.o scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MOD=
ULES),$(KBUILD_BUILTIN),vmlinux) FORCE
> > +%.ko: %.o %.mod.o scripts/module.lds scripts/mod/modinfo.o $(and $(CON=
FIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),vmlinux) FORCE
> >         +$(call if_changed_except,ld_ko_o,vmlinux)
> >  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
> >         +$(if $(newer-prereqs),$(call cmd,btf_ko))
> >  endif
> >
> > -targets +=3D $(modules:%.o=3D%.ko) $(modules:%.o=3D%.mod.o)
> > +targets +=3D $(modules:%.o=3D%.ko) $(modules:%.o=3D%.mod.o) scripts/mo=
d/modinfo.o
> >
> >  # Add FORCE to the prerequisites of a target to force it to be always =
rebuilt.
> >  # --------------------------------------------------------------------=
-------
> > diff --git a/scripts/mod/modinfo.c b/scripts/mod/modinfo.c
> > new file mode 100644
> > index 000000000000..12fbc6d3aae8
> > --- /dev/null
> > +++ b/scripts/mod/modinfo.c
> > @@ -0,0 +1,25 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/module.h>
> > +/*
> > + * Include build-salt.h after module.h in order to
> > + * inherit the definitions.
> > + */
> > +#define INCLUDE_VERMAGIC
> > +#include <linux/build-salt.h>
> > +#include <linux/elfnote-lto.h>
> > +#include <linux/vermagic.h>
> > +
> > +#ifdef CONFIG_UNWINDER_ORC
> > +#include <asm/orc_header.h>
> > +ORC_HEADER;
> > +#endif
> > +
> > +BUILD_SALT;
> > +BUILD_LTO_INFO;
> > +
> > +MODULE_INFO(vermagic, VERMAGIC_STRING);
> > +
> > +#ifdef CONFIG_MITIGATION_RETPOLINE
> > +MODULE_INFO(retpoline, "Y");
> > +#endif
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index c8cd5d822bb6..107393a8c48a 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -1755,26 +1755,9 @@ static void check_modname_len(struct module *mod=
)
> >  static void add_header(struct buffer *b, struct module *mod)
> >  {
> >         buf_printf(b, "#include <linux/module.h>\n");
> > -       /*
> > -        * Include build-salt.h after module.h in order to
> > -        * inherit the definitions.
> > -        */
> > -       buf_printf(b, "#define INCLUDE_VERMAGIC\n");
> > -       buf_printf(b, "#include <linux/build-salt.h>\n");
> > -       buf_printf(b, "#include <linux/elfnote-lto.h>\n");
> >         buf_printf(b, "#include <linux/export-internal.h>\n");
> > -       buf_printf(b, "#include <linux/vermagic.h>\n");
> >         buf_printf(b, "#include <linux/compiler.h>\n");
> >         buf_printf(b, "\n");
> > -       buf_printf(b, "#ifdef CONFIG_UNWINDER_ORC\n");
> > -       buf_printf(b, "#include <asm/orc_header.h>\n");
> > -       buf_printf(b, "ORC_HEADER;\n");
> > -       buf_printf(b, "#endif\n");
> > -       buf_printf(b, "\n");
> > -       buf_printf(b, "BUILD_SALT;\n");
> > -       buf_printf(b, "BUILD_LTO_INFO;\n");
> > -       buf_printf(b, "\n");
> > -       buf_printf(b, "MODULE_INFO(vermagic, VERMAGIC_STRING);\n");
> >         buf_printf(b, "MODULE_INFO(name, KBUILD_MODNAME);\n");
> >         buf_printf(b, "\n");
> >         buf_printf(b, "__visible struct module __this_module\n");
> > @@ -1792,12 +1775,6 @@ static void add_header(struct buffer *b, struct =
module *mod)
> >         if (!external_module)
> >                 buf_printf(b, "\nMODULE_INFO(intree, \"Y\");\n");
> >
> > -       buf_printf(b,
> > -                  "\n"
> > -                  "#ifdef CONFIG_MITIGATION_RETPOLINE\n"
> > -                  "MODULE_INFO(retpoline, \"Y\");\n"
> > -                  "#endif\n");
> > -
> >         if (strstarts(mod->name, "drivers/staging"))
> >                 buf_printf(b, "\nMODULE_INFO(staging, \"Y\");\n");
> >
> > diff --git a/scripts/package/install-extmod-build b/scripts/package/ins=
tall-extmod-build
> > index d2c9cacecc0c..15fab6d5dd56 100755
> > --- a/scripts/package/install-extmod-build
> > +++ b/scripts/package/install-extmod-build
> > @@ -37,6 +37,7 @@ mkdir -p "${destdir}"
> >         echo include/config/auto.conf
> >         echo include/config/kernel.release
> >         echo include/generated
> > +       echo scripts/mod/modinfo.o
> >         find_in_scripts
> >
> >         if is_enabled CONFIG_GCC_PLUGINS; then
> > @@ -78,4 +79,4 @@ if [ "${CC}" !=3D "${HOSTCC}" ] && is_enabled CONFIG_=
CC_CAN_LINK; then
> >         rm -f "${destdir}/Kbuild" "${destdir}/scripts/Kbuild"
> >  fi
> >
> > -find "${destdir}" \( -name '.*.cmd' -o -name '*.o' \) -delete
> > +find "${destdir}" \( -name '.*.cmd' -o \( -name '*.o' -a -! -path '*/s=
cripts/mod/modinfo.o' \) \) -delete
>
>
> This is not an enough hack because scripts/mod/modinfo.o
> is a new requirement for building external modules.
>
> 'make clean' would need a similar treatment.
>
> 'make help' goes:
>
>   clean   - Remove most generated files but keep the config and
>             enough build support to build external modules
>
>
>
>
>
>
> Or, another approach is to generate a different object
> when building external modules.
>
> A patch attached (on top of this).



The previous one was buggy.

Re-attached.



--=20
Best Regards
Masahiro Yamada

--00000000000061ad4c062110ea16
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-fix.patch"
Content-Disposition: attachment; filename="0001-fix.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m0jrb50j0>
X-Attachment-Id: f_m0jrb50j0

RnJvbSBhMmZiYzc5Yzg4ZjQyNDY5NmEzMjAxMTIwMjkwZTg2MDBiZDA1ZGRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3Jn
PgpEYXRlOiBTdW4sIDEgU2VwIDIwMjQgMjE6MjI6MjggKzA5MDAKU3ViamVjdDogW1BBVENIXSBm
aXgKClNpZ25lZC1vZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+
Ci0tLQogc2NyaXB0cy9NYWtlZmlsZS5tb2RmaW5hbCAgICAgICAgICAgICAgICAgIHwgOCArKyst
LS0tLQogc2NyaXB0cy97bW9kL21vZGluZm8uYyA9PiBtb2R1bGUtY29tbW9uLmN9IHwgMAogc2Ny
aXB0cy9wYWNrYWdlL2luc3RhbGwtZXh0bW9kLWJ1aWxkICAgICAgIHwgMyArLS0KIDMgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQogcmVuYW1lIHNjcmlwdHMv
e21vZC9tb2RpbmZvLmMgPT4gbW9kdWxlLWNvbW1vbi5jfSAoMTAwJSkKCmRpZmYgLS1naXQgYS9z
Y3JpcHRzL01ha2VmaWxlLm1vZGZpbmFsIGIvc2NyaXB0cy9NYWtlZmlsZS5tb2RmaW5hbAppbmRl
eCBkZGUwOWRjNGJhMTEuLjZiMWI3MjI1N2IyOSAxMDA2NDQKLS0tIGEvc2NyaXB0cy9NYWtlZmls
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
JChleHRtb2RfcHJlZml4KS5tb2R1bGUtY29tbW9uLm8gc2NyaXB0cy9tb2R1bGUubGRzICQoYW5k
ICQoQ09ORklHX0RFQlVHX0lORk9fQlRGX01PRFVMRVMpLCQoS0JVSUxEX0JVSUxUSU4pLHZtbGlu
dXgpIEZPUkNFCiAJKyQoY2FsbCBpZl9jaGFuZ2VkX2V4Y2VwdCxsZF9rb19vLHZtbGludXgpCiBp
ZmRlZiBDT05GSUdfREVCVUdfSU5GT19CVEZfTU9EVUxFUwogCSskKGlmICQobmV3ZXItcHJlcmVx
cyksJChjYWxsIGNtZCxidGZfa28pKQogZW5kaWYKIAotdGFyZ2V0cyArPSAkKG1vZHVsZXM6JS5v
PSUua28pICQobW9kdWxlczolLm89JS5tb2Qubykgc2NyaXB0cy9tb2QvbW9kaW5mby5vCit0YXJn
ZXRzICs9ICQobW9kdWxlczolLm89JS5rbykgJChtb2R1bGVzOiUubz0lLm1vZC5vKSAkKGV4dG1v
ZF9wcmVmaXgpLm1vZHVsZS1jb21tb24ubwogCiAjIEFkZCBGT1JDRSB0byB0aGUgcHJlcmVxdWlz
aXRlcyBvZiBhIHRhcmdldCB0byBmb3JjZSBpdCB0byBiZSBhbHdheXMgcmVidWlsdC4KICMgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCmRpZmYgLS1naXQgYS9zY3JpcHRzL21vZC9tb2RpbmZvLmMgYi9zY3Jp
cHRzL21vZHVsZS1jb21tb24uYwpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gc2Ny
aXB0cy9tb2QvbW9kaW5mby5jCnJlbmFtZSB0byBzY3JpcHRzL21vZHVsZS1jb21tb24uYwpkaWZm
IC0tZ2l0IGEvc2NyaXB0cy9wYWNrYWdlL2luc3RhbGwtZXh0bW9kLWJ1aWxkIGIvc2NyaXB0cy9w
YWNrYWdlL2luc3RhbGwtZXh0bW9kLWJ1aWxkCmluZGV4IDE1ZmFiNmQ1ZGQ1Ni4uZDJjOWNhY2Vj
YzBjIDEwMDc1NQotLS0gYS9zY3JpcHRzL3BhY2thZ2UvaW5zdGFsbC1leHRtb2QtYnVpbGQKKysr
IGIvc2NyaXB0cy9wYWNrYWdlL2luc3RhbGwtZXh0bW9kLWJ1aWxkCkBAIC0zNyw3ICszNyw2IEBA
IG1rZGlyIC1wICIke2Rlc3RkaXJ9IgogCWVjaG8gaW5jbHVkZS9jb25maWcvYXV0by5jb25mCiAJ
ZWNobyBpbmNsdWRlL2NvbmZpZy9rZXJuZWwucmVsZWFzZQogCWVjaG8gaW5jbHVkZS9nZW5lcmF0
ZWQKLQllY2hvIHNjcmlwdHMvbW9kL21vZGluZm8ubwogCWZpbmRfaW5fc2NyaXB0cwogCiAJaWYg
aXNfZW5hYmxlZCBDT05GSUdfR0NDX1BMVUdJTlM7IHRoZW4KQEAgLTc5LDQgKzc4LDQgQEAgaWYg
WyAiJHtDQ30iICE9ICIke0hPU1RDQ30iIF0gJiYgaXNfZW5hYmxlZCBDT05GSUdfQ0NfQ0FOX0xJ
Tks7IHRoZW4KIAlybSAtZiAiJHtkZXN0ZGlyfS9LYnVpbGQiICIke2Rlc3RkaXJ9L3NjcmlwdHMv
S2J1aWxkIgogZmkKIAotZmluZCAiJHtkZXN0ZGlyfSIgXCggLW5hbWUgJy4qLmNtZCcgLW8gXCgg
LW5hbWUgJyoubycgLWEgLSEgLXBhdGggJyovc2NyaXB0cy9tb2QvbW9kaW5mby5vJyBcKSBcKSAt
ZGVsZXRlCitmaW5kICIke2Rlc3RkaXJ9IiBcKCAtbmFtZSAnLiouY21kJyAtbyAtbmFtZSAnKi5v
JyBcKSAtZGVsZXRlCi0tIAoyLjQzLjAKCg==
--00000000000061ad4c062110ea16--

