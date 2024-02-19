Return-Path: <linux-kbuild+bounces-997-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB93B85ABF3
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Feb 2024 20:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72493283D1E
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Feb 2024 19:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C405750275;
	Mon, 19 Feb 2024 19:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nxtl1F4e"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D8351009;
	Mon, 19 Feb 2024 19:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708370597; cv=none; b=prZ7fbYEUcCVZhbyhsz1zhAG++ubmSVSf3zNiQnp64BsDfbX1jI/BBioE3IUFdV5jPt2RxO2ciZ10RkGt+L79PBt55s0OuCchStEUFAG31cZGPShLTp93D8GPcDUrUg3UJT4wruITLKQJ6snBSiva0d7qQ7YFcwTt0uhaHI83NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708370597; c=relaxed/simple;
	bh=8lEemEGbo3pquAOQmDG+wzlwxz9lm0nxhOinhiZwrIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DB+QT4uW64OfwL4XpE7qhLui0r+Oj3O1M+baeS3qWeXataupKphTEX9quP2oi30MCS0HYkB8FSfJlAHX7ii1Cbqxonl5K4nkIn3fyfrpt9mMKnY0s9uITFuhaPQu5iSXJYw4+FPgPixRO0eNQlsFyqihA6aJEN3K+jRhFJqRQv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nxtl1F4e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57C1C433F1;
	Mon, 19 Feb 2024 19:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708370597;
	bh=8lEemEGbo3pquAOQmDG+wzlwxz9lm0nxhOinhiZwrIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nxtl1F4ey1UELr/iVxk/l99qYPkexo3TnIOyxA21Yge/EKpMURvXKTN5f4Gx/tslc
	 GdoMysayp4TQVrLjW5cx8PnTIvZ6v1ZGW0aKjF2WRV53z8fZmp6lO8DzE23Y5UuQiW
	 0c/SY9CJ5SPl2f1osmIoMOrSIgVdrP4MvRfozkkD0/I0E0HoIZlF3nEE80nr1O2co3
	 QO1P8Fcf7AxfJnCdqpR/WefVECKRvPsbg8ccPV3BOJjNQXlIVD7pyYFidvSDJpsCzj
	 jkfpAOLBMCZddbzh7lZ3B7fjAbrTrTeG3hxF3XoMJPI8Efx4LcmgG+oXasHSvqLXfs
	 2DtzGMF7Y7gwA==
Date: Mon, 19 Feb 2024 12:23:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: gregkh@linuxfoundation.org
Cc: masahiroy@kernel.org, stable-commits@vger.kernel.org,
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: Re: Patch "um: Fix adding '-no-pie' for clang" has been added to the
 6.1-stable tree
Message-ID: <20240219192315.GC2348301@dev-arch.thelio-3990X>
References: <2024021953-shrimp-trilogy-590a@gregkh>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="cQJ1qndit6dbS4xH"
Content-Disposition: inline
In-Reply-To: <2024021953-shrimp-trilogy-590a@gregkh>


--cQJ1qndit6dbS4xH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg,

On Mon, Feb 19, 2024 at 05:50:54PM +0100, gregkh@linuxfoundation.org wrote:
> 
> This is a note to let you know that I've just added the patch titled
> 
>     um: Fix adding '-no-pie' for clang
> 
> to the 6.1-stable tree which can be found at:
>     http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
> 
> The filename of the patch is:
>      um-fix-adding-no-pie-for-clang.patch
> and it can be found in the queue-6.1 subdirectory.
> 
> If you, or anyone else, feels it should not be added to the stable tree,
> please let <stable@vger.kernel.org> know about it.
> 
> 
> From 846cfbeed09b45d985079a9173cf390cc053715b Mon Sep 17 00:00:00 2001
> From: Nathan Chancellor <nathan@kernel.org>
> Date: Tue, 23 Jan 2024 15:59:54 -0700
> Subject: um: Fix adding '-no-pie' for clang
> 
> From: Nathan Chancellor <nathan@kernel.org>
> 
> commit 846cfbeed09b45d985079a9173cf390cc053715b upstream.

Please replace this patch with the attached series. While this patch
does fix this particular issue, commit 397586506c3d ("modpost: Add
'.ltext' and '.ltext.*' to TEXT_SECTIONS") is also needed to resolve all
errors with clang-18+ and ARCH=um. That commit needs a few (reasonable,
imo) prerequisite patches to apply cleanly without causing any build
warnings, as I point out on the 6.6 patch.

If there are any issues, please let me know.

Cheers,
Nathan

--cQJ1qndit6dbS4xH
Content-Type: application/mbox
Content-Disposition: attachment; filename="6.1-fix-um-clang-18.mbox"
Content-Transfer-Encoding: quoted-printable

=46rom 8a6779d66db859df16b8b948ba6e51f467a8c6f4 Mon Sep 17 00:00:00 2001=0A=
=46rom: Masahiro Yamada <masahiroy@kernel.org>=0ADate: Tue, 6 Jun 2023 18:4=
1:59 +0900=0ASubject: [PATCH 6.1 1/6] modpost: propagate W=3D1 build option=
 to modpost=0A=0Acommit 20ff36856fe00879f82de71fe6f1482ca1b72334 upstream.=
=0A=0A"No build warning" is a strong requirement these days, so you must fi=
x=0Aall issues before enabling a new warning flag.=0A=0AWe often add a new =
warning to W=3D1 first so that the kbuild test robot=0Ablocks new breakages=
=2E=0A=0AThis commit allows modpost to show extra warnings only when W=3D1=
=0A(or KBUILD_EXTRA_WARN=3D1) is given.=0A=0ASigned-off-by: Masahiro Yamada=
 <masahiroy@kernel.org>=0AReviewed-by: Nick Desaulniers <ndesaulniers@googl=
e.com>=0ASigned-off-by: Nathan Chancellor <nathan@kernel.org>=0A---=0A scri=
pts/Makefile.modpost | 1 +=0A scripts/mod/modpost.c    | 7 ++++++-=0A 2 fil=
es changed, 7 insertions(+), 1 deletion(-)=0A=0Adiff --git a/scripts/Makefi=
le.modpost b/scripts/Makefile.modpost=0Aindex e41dee64d429..39aea753d0bd 10=
0644=0A--- a/scripts/Makefile.modpost=0A+++ b/scripts/Makefile.modpost=0A@@=
 -44,6 +44,7 @@ modpost-args =3D										\=0A 	$(if $(CONFIG_SECTION_MISMA=
TCH_WARN_ONLY),,-E)					\=0A 	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS))		=
			\=0A 	$(if $(CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS)$(KBUILD_NSDE=
PS),-N)	\=0A+	$(if $(findstring 1, $(KBUILD_EXTRA_WARN)),-W)					\=0A 	-o $=
@=0A =0A # 'make -i -k' ignores compile errors, and builds as many modules =
as possible.=0Adiff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c=
=0Aindex e6be7fc2625f..9ef2f6423e80 100644=0A--- a/scripts/mod/modpost.c=0A=
+++ b/scripts/mod/modpost.c=0A@@ -41,6 +41,8 @@ static bool allow_missing_n=
s_imports;=0A =0A static bool error_occurred;=0A =0A+static bool extra_warn=
;=0A+=0A /*=0A  * Cut off the warnings when there are too many. This typica=
lly occurs when=0A  * vmlinux is missing. ('make modules' without building =
vmlinux.)=0A@@ -2290,7 +2292,7 @@ int main(int argc, char **argv)=0A 	LIST_=
HEAD(dump_lists);=0A 	struct dump_list *dl, *dl2;=0A =0A-	while ((opt =3D g=
etopt(argc, argv, "ei:mnT:o:awENd:")) !=3D -1) {=0A+	while ((opt =3D getopt=
(argc, argv, "ei:mnT:o:aWwENd:")) !=3D -1) {=0A 		switch (opt) {=0A 		case =
'e':=0A 			external_module =3D true;=0A@@ -2315,6 +2317,9 @@ int main(int a=
rgc, char **argv)=0A 		case 'T':=0A 			files_source =3D optarg;=0A 			break=
;=0A+		case 'W':=0A+			extra_warn =3D true;=0A+			break;=0A 		case 'w':=0A =
			warn_unresolved =3D true;=0A 			break;=0A=0Abase-commit: 8b4118fabd6eb75=
fed19483b04dab3a036886489=0A-- =0A2.43.2=0A=0A=0AFrom 036a47643b18d2b0754a8=
6902c1e7e76173fbc3f Mon Sep 17 00:00:00 2001=0AFrom: =3D?UTF-8?q?Uwe=3D20Kl=
eine-K=3DC3=3DB6nig?=3D <u.kleine-koenig@pengutronix.de>=0ADate: Sat, 30 Se=
p 2023 18:52:04 +0200=0ASubject: [PATCH 6.1 2/6] modpost: Don't let "driver=
"s reference .exit.*=0AMIME-Version: 1.0=0AContent-Type: text/plain; charse=
t=3DUTF-8=0AContent-Transfer-Encoding: 8bit=0A=0Acommit f177cd0c15fcc7bdbb6=
8d8d1a3166dead95314c8 upstream.=0A=0ADrivers must not reference functions m=
arked with __exit as these likely=0Aare not available when the code is buil=
t-in.=0A=0AThere are few creative offenders uncovered for example in ARCH=
=3Damd64=0Aallmodconfig builds. So only trigger the section mismatch warnin=
g for=0AW=3D1 builds.=0A=0AThe dual rule that drivers must not reference .i=
nit.* is implemented=0Asince commit 0db252452378 ("modpost: don't allow *dr=
iver to reference=0A.init.*") which however missed that .exit.* should be h=
andled in the=0Asame way.=0A=0AThanks to Masahiro Yamada and Arnd Bergmann =
who gave valuable hints to=0Afind this improvement.=0A=0ASigned-off-by: Uwe=
 Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>=0ASigned-off-by: Masahi=
ro Yamada <masahiroy@kernel.org>=0ASigned-off-by: Nathan Chancellor <nathan=
@kernel.org>=0A---=0A scripts/mod/modpost.c | 15 +++++++++++++--=0A 1 file =
changed, 13 insertions(+), 2 deletions(-)=0A=0Adiff --git a/scripts/mod/mod=
post.c b/scripts/mod/modpost.c=0Aindex 9ef2f6423e80..9a4a220ecbc2 100644=0A=
--- a/scripts/mod/modpost.c=0A+++ b/scripts/mod/modpost.c=0A@@ -1087,9 +108=
7,20 @@ static int secref_whitelist(const struct sectioncheck *mismatch,=0A=
 				    "*_console")))=0A 		return 0;=0A =0A-	/* symbols in data sections =
that may refer to meminit/exit sections */=0A+	/* symbols in data sections =
that may refer to meminit sections */=0A 	if (match(fromsec, PATTERNS(DATA_=
SECTIONS)) &&=0A-	    match(tosec, PATTERNS(ALL_XXXINIT_SECTIONS, ALL_EXIT_=
SECTIONS)) &&=0A+	    match(tosec, PATTERNS(ALL_XXXINIT_SECTIONS, ALL_XXXEX=
IT_SECTIONS)) &&=0A+	    match(fromsym, PATTERNS("*driver")))=0A+		return 0=
;=0A+=0A+	/*=0A+	 * symbols in data sections must not refer to .exit.*, but=
 there are=0A+	 * quite a few offenders, so hide these unless for W=3D1 bui=
lds until=0A+	 * these are fixed.=0A+	 */=0A+	if (!extra_warn &&=0A+	    ma=
tch(fromsec, PATTERNS(DATA_SECTIONS)) &&=0A+	    match(tosec, PATTERNS(EXIT=
_SECTIONS)) &&=0A 	    match(fromsym, PATTERNS("*driver")))=0A 		return 0;=
=0A =0A-- =0A2.43.2=0A=0A=0AFrom a47c47ed8675735925e1c696128ccd3446dad187 M=
on Sep 17 00:00:00 2001=0AFrom: Masahiro Yamada <masahiroy@kernel.org>=0ADa=
te: Mon, 23 Oct 2023 02:06:05 +0900=0ASubject: [PATCH 6.1 3/6] linux/init: =
remove __memexit* annotations=0A=0Acommit 6a4e59eeedc3018cb57722eecfcbb4943=
1aeb05f upstream.=0A=0AWe have never used __memexit, __memexitdata, or __me=
mexitconst.=0A=0AThese were unneeded.=0A=0ASigned-off-by: Masahiro Yamada <=
masahiroy@kernel.org>=0AAcked-by: Arnd Bergmann <arnd@arndb.de>=0A[nathan: =
Remove additional case of XXXEXIT_TO_SOME_EXIT due to lack of=0A         78=
dac1a22944 in 6.1]=0ASigned-off-by: Nathan Chancellor <nathan@kernel.org>=
=0A---=0A include/asm-generic/vmlinux.lds.h |  6 ------=0A include/linux/in=
it.h              |  3 ---=0A scripts/mod/modpost.c             | 16 +++---=
----------=0A 3 files changed, 3 insertions(+), 22 deletions(-)=0A=0Adiff -=
-git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.=
h=0Aindex 7ad6f51b3d91..1d1f480a5e9e 100644=0A--- a/include/asm-generic/vml=
inux.lds.h=0A+++ b/include/asm-generic/vmlinux.lds.h=0A@@ -351,7 +351,6 @@=
=0A 	*(.ref.data)							\=0A 	*(.data..shared_aligned) /* percpu related */=
			\=0A 	MEM_KEEP(init.data*)						\=0A-	MEM_KEEP(exit.data*)						\=0A 	*(=
=2Edata.unlikely)						\=0A 	__start_once =3D .;						\=0A 	*(.data.once)		=
					\=0A@@ -546,7 +545,6 @@=0A 	__init_rodata : AT(ADDR(__init_rodata) - L=
OAD_OFFSET) {		\=0A 		*(.ref.rodata)						\=0A 		MEM_KEEP(init.rodata)					=
\=0A-		MEM_KEEP(exit.rodata)					\=0A 	}								\=0A 									\=0A 	/* Buil=
t-in module parameters. */				\=0A@@ -601,7 +599,6 @@=0A 		*(.ref.text)				=
		\=0A 		*(.text.asan.* .text.tsan.*)				\=0A 	MEM_KEEP(init.text*)						\=
=0A-	MEM_KEEP(exit.text*)						\=0A =0A =0A /* sched.text is aling to funct=
ion alignment to secure we have same=0A@@ -751,13 +748,10 @@=0A 	*(.exit.da=
ta .exit.data.*)					\=0A 	*(.fini_array .fini_array.*)					\=0A 	*(.dtors =
=2Edtors.*)						\=0A-	MEM_DISCARD(exit.data*)						\=0A-	MEM_DISCARD(exit.=
rodata*)=0A =0A #define EXIT_TEXT							\=0A 	*(.exit.text)							\=0A 	*(.=
text.exit)							\=0A-	MEM_DISCARD(exit.text)=0A =0A #define EXIT_CALL					=
		\=0A 	*(.exitcall.exit)=0Adiff --git a/include/linux/init.h b/include/lin=
ux/init.h=0Aindex 077d7f93b402..c96aea3229ca 100644=0A--- a/include/linux/i=
nit.h=0A+++ b/include/linux/init.h=0A@@ -87,9 +87,6 @@=0A 						  __latent_=
entropy=0A #define __meminitdata    __section(".meminit.data")=0A #define _=
_meminitconst   __section(".meminit.rodata")=0A-#define __memexit        __=
section(".memexit.text") __exitused __cold notrace=0A-#define __memexitdata=
    __section(".memexit.data")=0A-#define __memexitconst   __section(".meme=
xit.rodata")=0A =0A /* For assembly routines */=0A #define __HEAD		.section=
	".head.text","ax"=0Adiff --git a/scripts/mod/modpost.c b/scripts/mod/modpo=
st.c=0Aindex 9a4a220ecbc2..61a13d55c0e3 100644=0A--- a/scripts/mod/modpost.=
c=0A+++ b/scripts/mod/modpost.c=0A@@ -811,7 +811,7 @@ static void check_sec=
tion(const char *modname, struct elf_info *elf,=0A #define ALL_INIT_TEXT_SE=
CTIONS \=0A 	".init.text", ".meminit.text"=0A #define ALL_EXIT_TEXT_SECTION=
S \=0A-	".exit.text", ".memexit.text"=0A+	".exit.text"=0A =0A #define ALL_P=
CI_INIT_SECTIONS	\=0A 	".pci_fixup_early", ".pci_fixup_header", ".pci_fixup=
_final", \=0A@@ -819,10 +819,9 @@ static void check_section(const char *mod=
name, struct elf_info *elf,=0A 	".pci_fixup_resume_early", ".pci_fixup_susp=
end"=0A =0A #define ALL_XXXINIT_SECTIONS MEM_INIT_SECTIONS=0A-#define ALL_X=
XXEXIT_SECTIONS MEM_EXIT_SECTIONS=0A =0A #define ALL_INIT_SECTIONS INIT_SEC=
TIONS, ALL_XXXINIT_SECTIONS=0A-#define ALL_EXIT_SECTIONS EXIT_SECTIONS, ALL=
_XXXEXIT_SECTIONS=0A+#define ALL_EXIT_SECTIONS EXIT_SECTIONS=0A =0A #define=
 DATA_SECTIONS ".data", ".data.rel"=0A #define TEXT_SECTIONS ".text", ".tex=
t.unlikely", ".sched.text", \=0A@@ -835,7 +834,6 @@ static void check_secti=
on(const char *modname, struct elf_info *elf,=0A #define MEM_INIT_SECTIONS =
 ".meminit.*"=0A =0A #define EXIT_SECTIONS      ".exit.*"=0A-#define MEM_EX=
IT_SECTIONS  ".memexit.*"=0A =0A #define ALL_TEXT_SECTIONS  ALL_INIT_TEXT_S=
ECTIONS, ALL_EXIT_TEXT_SECTIONS, \=0A 		TEXT_SECTIONS, OTHER_TEXT_SECTIONS=
=0A@@ -864,7 +862,6 @@ enum mismatch {=0A 	TEXT_TO_ANY_EXIT,=0A 	DATA_TO_AN=
Y_EXIT,=0A 	XXXINIT_TO_SOME_INIT,=0A-	XXXEXIT_TO_SOME_EXIT,=0A 	ANY_INIT_TO=
_ANY_EXIT,=0A 	ANY_EXIT_TO_ANY_INIT,=0A 	EXPORT_TO_INIT_EXIT,=0A@@ -939,12 =
+936,6 @@ static const struct sectioncheck sectioncheck[] =3D {=0A 	.bad_to=
sec =3D { INIT_SECTIONS, NULL },=0A 	.mismatch =3D XXXINIT_TO_SOME_INIT,=0A=
 },=0A-/* Do not reference exit code/data from memexit code/data */=0A-{=0A=
-	.fromsec =3D { ALL_XXXEXIT_SECTIONS, NULL },=0A-	.bad_tosec =3D { EXIT_SE=
CTIONS, NULL },=0A-	.mismatch =3D XXXEXIT_TO_SOME_EXIT,=0A-},=0A /* Do not =
use exit code/data from init code */=0A {=0A 	.fromsec =3D { ALL_INIT_SECTI=
ONS, NULL },=0A@@ -1089,7 +1080,7 @@ static int secref_whitelist(const stru=
ct sectioncheck *mismatch,=0A =0A 	/* symbols in data sections that may ref=
er to meminit sections */=0A 	if (match(fromsec, PATTERNS(DATA_SECTIONS)) &=
&=0A-	    match(tosec, PATTERNS(ALL_XXXINIT_SECTIONS, ALL_XXXEXIT_SECTIONS)=
) &&=0A+	    match(tosec, PATTERNS(ALL_XXXINIT_SECTIONS)) &&=0A 	    match(=
=66romsym, PATTERNS("*driver")))=0A 		return 0;=0A =0A@@ -1267,7 +1258,6 @@=
 static void report_sec_mismatch(const char *modname,=0A 	case TEXT_TO_ANY_=
EXIT:=0A 	case DATA_TO_ANY_EXIT:=0A 	case XXXINIT_TO_SOME_INIT:=0A-	case XX=
XEXIT_TO_SOME_EXIT:=0A 	case ANY_INIT_TO_ANY_EXIT:=0A 	case ANY_EXIT_TO_ANY=
_INIT:=0A 		warn("%s: section mismatch in reference: %s (section: %s) -> %s=
 (section: %s)\n",=0A-- =0A2.43.2=0A=0A=0AFrom a2633f3fd62266b7b480e2247b48=
b2400b0b1fbe Mon Sep 17 00:00:00 2001=0AFrom: Nathan Chancellor <nathan@ker=
nel.org>=0ADate: Tue, 13 Dec 2022 11:35:29 -0700=0ASubject: [PATCH 6.1 4/6]=
 modpost: Include '.text.*' in TEXT_SECTIONS=0A=0Acommit 19331e84c387325653=
7d446afec1f6c507f8c4ef upstream.=0A=0ACommit 6c730bfc894f ("modpost: handle=
 -ffunction-sections") added=0A".text.*" to the OTHER_TEXT_SECTIONS macro t=
o fix certain section=0Amismatch warnings. Unfortunately, this makes it imp=
ossible for modpost=0Ato warn about section mismatches with LTO, which impl=
ies=0A'-ffunction-sections', as all functions are put in their own=0A'.text=
=2E<func_name>' sections, which may still reference functions in=0Asections=
 they are not supposed to, such as __init.=0A=0AFix this by moving ".text.*=
" into TEXT_SECTIONS, so that configurations=0Awith '-ffunction-sections' w=
ill see warnings about mismatched sections.=0A=0ALink: https://lore.kernel.=
org/Y39kI3MOtVI5BAnV@google.com/=0AReported-by: Vincent Donnefort <vdonnefo=
rt@google.com>=0AReviewed-and-tested-by: Alexander Lobakin <alexandr.lobaki=
n@intel.com>=0AReviewed-by: Sami Tolvanen <samitolvanen@google.com>=0ATeste=
d-by: Vincent Donnefort <vdonnefort@google.com>=0ASigned-off-by: Nathan Cha=
ncellor <nathan@kernel.org>=0ASigned-off-by: Masahiro Yamada <masahiroy@ker=
nel.org>=0ASigned-off-by: Nathan Chancellor <nathan@kernel.org>=0A---=0A sc=
ripts/mod/modpost.c | 4 ++--=0A 1 file changed, 2 insertions(+), 2 deletion=
s(-)=0A=0Adiff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c=0Ainde=
x 61a13d55c0e3..233f8eae09a6 100644=0A--- a/scripts/mod/modpost.c=0A+++ b/s=
cripts/mod/modpost.c=0A@@ -824,10 +824,10 @@ static void check_section(cons=
t char *modname, struct elf_info *elf,=0A #define ALL_EXIT_SECTIONS EXIT_SE=
CTIONS=0A =0A #define DATA_SECTIONS ".data", ".data.rel"=0A-#define TEXT_SE=
CTIONS ".text", ".text.unlikely", ".sched.text", \=0A+#define TEXT_SECTIONS=
 ".text", ".text.*", ".sched.text", \=0A 		".kprobes.text", ".cpuidle.text"=
, ".noinstr.text"=0A #define OTHER_TEXT_SECTIONS ".ref.text", ".head.text",=
 ".spinlock.text", \=0A-		".fixup", ".entry.text", ".exception.text", ".tex=
t.*", \=0A+		".fixup", ".entry.text", ".exception.text", \=0A 		".coldtext"=
, ".softirqentry.text"=0A =0A #define INIT_SECTIONS      ".init.*"=0A-- =0A=
2.43.2=0A=0A=0AFrom e6c03b847dfa1346953fc9585e77edf1aa2561e0 Mon Sep 17 00:=
00:00 2001=0AFrom: Nathan Chancellor <nathan@kernel.org>=0ADate: Tue, 23 Ja=
n 2024 15:59:54 -0700=0ASubject: [PATCH 6.1 5/6] um: Fix adding '-no-pie' f=
or clang=0A=0Acommit 846cfbeed09b45d985079a9173cf390cc053715b upstream.=0A=
=0AThe kernel builds with -fno-PIE, so commit 883354afbc10 ("um: link=0Avml=
inux with -no-pie") added the compiler linker flag '-no-pie' via=0Acc-optio=
n because '-no-pie' was only supported in GCC 6.1.0 and newer.=0A=0AWhile t=
his works for GCC, this does not work for clang because cc-option=0Auses '-=
c', which stops the pipeline right before linking, so '-no-pie'=0Ais uncons=
umed and clang warns, causing cc-option to fail just as it=0Awould if the o=
ption was entirely unsupported:=0A=0A  $ clang -Werror -no-pie -c -o /dev/n=
ull -x c /dev/null=0A  clang-16: error: argument unused during compilation:=
 '-no-pie' [-Werror,-Wunused-command-line-argument]=0A=0AA recent version o=
f clang exposes this because it generates a relocation=0Aunder '-mcmodel=3D=
large' that is not supported in PIE mode:=0A=0A  /usr/sbin/ld: init/main.o:=
 relocation R_X86_64_32 against symbol `saved_command_line' can not be used=
 when making a PIE object; recompile with -fPIE=0A  /usr/sbin/ld: failed to=
 set dynamic section sizes: bad value=0A  clang: error: linker command fail=
ed with exit code 1 (use -v to see invocation)=0A=0ARemove the cc-option ch=
eck altogether. It is wasteful to invoke the=0Acompiler to check for '-no-p=
ie' because only one supported compiler=0Aversion does not support it, GCC =
5.x (as it is supported with the=0Aminimum version of clang and GCC 6.1.0+)=
=2E Use a combination of the=0Agcc-min-version macro and CONFIG_CC_IS_CLANG=
 to unconditionally add=0A'-no-pie' with CONFIG_LD_SCRIPT_DYN=3Dy, so that =
it is enabled with all=0Acompilers that support this. Furthermore, using gc=
c-min-version can help=0Aturn this back into=0A=0A  LINK-$(CONFIG_LD_SCRIPT=
_DYN) +=3D -no-pie=0A=0Awhen the minimum version of GCC is bumped past 6.1.=
0.=0A=0ACc: stable@vger.kernel.org=0ACloses: https://github.com/ClangBuiltL=
inux/linux/issues/1982=0ASigned-off-by: Nathan Chancellor <nathan@kernel.or=
g>=0ASigned-off-by: Masahiro Yamada <masahiroy@kernel.org>=0ASigned-off-by:=
 Nathan Chancellor <nathan@kernel.org>=0A---=0A arch/um/Makefile | 4 +++-=
=0A 1 file changed, 3 insertions(+), 1 deletion(-)=0A=0Adiff --git a/arch/u=
m/Makefile b/arch/um/Makefile=0Aindex 3dbd0e3b660e..778c50f27399 100644=0A-=
-- a/arch/um/Makefile=0A+++ b/arch/um/Makefile=0A@@ -118,7 +118,9 @@ archpr=
epare:=0A 	$(Q)$(MAKE) $(build)=3D$(HOST_DIR)/um include/generated/user_con=
stants.h=0A =0A LINK-$(CONFIG_LD_SCRIPT_STATIC) +=3D -static=0A-LINK-$(CONF=
IG_LD_SCRIPT_DYN) +=3D $(call cc-option, -no-pie)=0A+ifdef CONFIG_LD_SCRIPT=
_DYN=0A+LINK-$(call gcc-min-version, 60100)$(CONFIG_CC_IS_CLANG) +=3D -no-p=
ie=0A+endif=0A LINK-$(CONFIG_LD_SCRIPT_DYN_RPATH) +=3D -Wl,-rpath,/lib=0A =
=0A CFLAGS_NO_HARDENING :=3D $(call cc-option, -fno-PIC,) $(call cc-option,=
 -fno-pic,) \=0A-- =0A2.43.2=0A=0A=0AFrom 7e3d85ff880b1b5640c7f8a694615380c=
e09a8a3 Mon Sep 17 00:00:00 2001=0AFrom: Nathan Chancellor <nathan@kernel.o=
rg>=0ADate: Tue, 23 Jan 2024 15:59:55 -0700=0ASubject: [PATCH 6.1 6/6] modp=
ost: Add '.ltext' and '.ltext.*' to TEXT_SECTIONS=0A=0Acommit 397586506c3da=
005b9333ce5947ad01e8018a3be upstream.=0A=0AAfter the linked LLVM change, bu=
ilding ARCH=3Dum defconfig results in a=0Asegmentation fault in modpost. Pr=
ior to commit a23e7584ecf3 ("modpost:=0Aunify 'sym' and 'to' in default_mis=
match_handler()"), there was a=0Awarning:=0A=0A  WARNING: modpost: vmlinux.=
o(__ex_table+0x88): Section mismatch in reference to the .ltext:(unknown)=
=0A  WARNING: modpost: The relocation at __ex_table+0x88 references=0A  sec=
tion ".ltext" which is not in the list of=0A  authorized sections.  If you'=
re adding a new section=0A  and/or if this reference is valid, add ".ltext"=
 to the=0A  list of authorized sections to jump to on fault.=0A  This can b=
e achieved by adding ".ltext" to=0A  OTHER_TEXT_SECTIONS in scripts/mod/mod=
post.c.=0A=0AThe linked LLVM change moves global objects to the '.ltext' (a=
nd=0A'.ltext.*' with '-ffunction-sections') sections with '-mcmodel=3Dlarge=
',=0Awhich ARCH=3Dum uses. These sections should be handled just as '.text'=
=0Aand '.text.*' are, so add them to TEXT_SECTIONS.=0A=0ACc: stable@vger.ke=
rnel.org=0ACloses: https://github.com/ClangBuiltLinux/linux/issues/1981=0AL=
ink: https://github.com/llvm/llvm-project/commit/4bf8a688956a759b7b6b8d94f4=
2d25c13c7af130=0ASigned-off-by: Nathan Chancellor <nathan@kernel.org>=0ASig=
ned-off-by: Masahiro Yamada <masahiroy@kernel.org>=0ASigned-off-by: Nathan =
Chancellor <nathan@kernel.org>=0A---=0A scripts/mod/modpost.c | 3 ++-=0A 1 =
file changed, 2 insertions(+), 1 deletion(-)=0A=0Adiff --git a/scripts/mod/=
modpost.c b/scripts/mod/modpost.c=0Aindex 233f8eae09a6..686eed37f978 100644=
=0A--- a/scripts/mod/modpost.c=0A+++ b/scripts/mod/modpost.c=0A@@ -825,7 +8=
25,8 @@ static void check_section(const char *modname, struct elf_info *elf=
,=0A =0A #define DATA_SECTIONS ".data", ".data.rel"=0A #define TEXT_SECTION=
S ".text", ".text.*", ".sched.text", \=0A-		".kprobes.text", ".cpuidle.text=
", ".noinstr.text"=0A+		".kprobes.text", ".cpuidle.text", ".noinstr.text", =
\=0A+		".ltext", ".ltext.*"=0A #define OTHER_TEXT_SECTIONS ".ref.text", ".h=
ead.text", ".spinlock.text", \=0A 		".fixup", ".entry.text", ".exception.te=
xt", \=0A 		".coldtext", ".softirqentry.text"=0A-- =0A2.43.2=0A=0A
--cQJ1qndit6dbS4xH--

