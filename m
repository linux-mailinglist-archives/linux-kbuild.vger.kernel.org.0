Return-Path: <linux-kbuild+bounces-7364-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1846BACD750
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jun 2025 06:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE3D87A91F8
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jun 2025 04:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BAA132122;
	Wed,  4 Jun 2025 04:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UeXXy0Xx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FCE52F88;
	Wed,  4 Jun 2025 04:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749012797; cv=none; b=mrhk2akGirNjjrc+fWRWmnFdH2RdW/vnf8XXAiKzuRVtoucwXUW16k/vjgGwxz1TfVSIETj3B6fWwGnSQG0KulgArjJ+k8yLlOs0rjZNaXu5Aaxjb1m2t6qgm67Th3+25jvYzLpoTArPN4f9JYonJtxtqunXHl00gNVcuGrFMZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749012797; c=relaxed/simple;
	bh=SrbhwDJ+nDiTeZtiQ2Xu90AmIf8S7vfq2Mx1a4BsWOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ByfKNTT5wYfA44qRilg19mVTOt+xZmdGnm4rij/a9seNAFSIjxFMQqFBgEEKuhbhBf4V7rzhSkjNpSrBMZUlg7GQL7056sFbcz8wueG1UpdkPQq6AxAuOAB+0Nyp0g46SAeQI69bSlZOUoxGF5czXieQ34cHKfVlGde3E5Sh7a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UeXXy0Xx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7CFC4CEE7;
	Wed,  4 Jun 2025 04:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749012795;
	bh=SrbhwDJ+nDiTeZtiQ2Xu90AmIf8S7vfq2Mx1a4BsWOE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UeXXy0Xx0YTxNjZS3OiXi/uS+SXd+/008O56xAO3O7wxAK1FvNy5QIgdQVDYclGAp
	 +f4PT3AmzoMCuIjSxHERufBI/B/X7GRA/Ix2cNOy0V0BRuwvu/We8cJ3r0fyy/8Y2+
	 Bq45WVKuM90ETJBnkV+u1z/IVtNY5YO8xqaeo5FfdMUQo3ZgFKBt5toyfLFFOxs4Mk
	 Oqj8U/ZIctQzLA7q6QW4lG/ONxH0rehm+NvN2yLkBHesFcAcLKPbDLPpuyuaQIi6JR
	 T1cghqzvev+SOGmi2xatmmuNDD9gHQa65rpzOvTMzZAoqQE0go7b4jVpq7Q8VKPG5N
	 fj8NECJ0us7yA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54acc0cd458so7849403e87.0;
        Tue, 03 Jun 2025 21:53:14 -0700 (PDT)
X-Gm-Message-State: AOJu0YwzvhphjAlu474jO9cO+P09t4/MnVXKcOTHOYu0S1ZuO9Cwo6cu
	b7OOWYHU9s7p8Nl3GGfeps/8GP6qduclKVwj265j6PEqPv/cVz0+IKDoQjivLkZEL4ko1v63DJh
	sgnB631JPtfCwJWKEGUgy87iHdMOkogs=
X-Google-Smtp-Source: AGHT+IGQJyq7onKIxKh9qDRFyhxty3f5kTIY0Fs3AHW9pl2tG2XFZjxqQ/dccU5w9D8Ql4+zyfEBLpeCkUs5tMjG9Jk=
X-Received: by 2002:a05:6512:2399:b0:553:2ca4:39e2 with SMTP id
 2adb3069b0e04-55356df2526mr350087e87.52.1749012793583; Tue, 03 Jun 2025
 21:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250601133230.4085512-1-masahiroy@kernel.org> <20250601133230.4085512-3-masahiroy@kernel.org>
In-Reply-To: <20250601133230.4085512-3-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 4 Jun 2025 13:52:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNATH7Lewi+-3T3R5X1CVRbBGGsVQEdLJ2FqQP+8RRAOHkw@mail.gmail.com>
X-Gm-Features: AX0GCFv7SIfQaRCDgH4byQtWjC0CW1agBSw-Knm4H8zESxxOrlMOItTFOns_5M4
Message-ID: <CAK7LNATH7Lewi+-3T3R5X1CVRbBGGsVQEdLJ2FqQP+8RRAOHkw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] scripts/misc-check: check missing #include
 <linux/export.h> when W=1
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 1, 2025 at 10:32=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> The problem was described in commit 5b20755b7780 ("init: move THIS_MODULE
> from <linux/export.h> to <linux/init.h>").
>
> To summarize it again here: <linux/export.h> is included by most C files,
> even though only some of them actually export symbols. This is because
> some headers, such as include/linux/{module.h,linkage}, needlessly
> include <linux/export.h>.
>
> I have added a more detailed explanation in the comments of
> scripts/misc-check.
>
> This problem will be fixed in two steps:
>
>  1. Add #include <linux/export.h> to C files that use EXPORT_SYMBOL()
>  2. Remove #include <linux/export.h> from header files that do not use
>     EXPORT_SYMBOL()
>
> This commit addresses step 1; scripts/misc-check will warn about *.[ch]
> files that use EXPORT_SYMBOL() but do not include <linux/export.h>.
> This check is only triggered when the kernel is built with W=3D1.
>
> We need to fix 4000+ files. I hope others will help with this effort.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>  - Fix out-of-tree build
>
>  scripts/misc-check | 43 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/scripts/misc-check b/scripts/misc-check
> index 21551d721079..edc0e44d96de 100755
> --- a/scripts/misc-check
> +++ b/scripts/misc-check
> @@ -9,4 +9,47 @@ check_tracked_ignored_files () {
>                 sed 's/$/: warning: ignored by one of the .gitignore file=
s/' >&2
>  }
>
> +# Check for missing #include <linux/export.h>
> +#
> +# The rule for including <linux/export.h> is very simple:
> +# Include <linux/export.h> only when you use EXPORT_SYMBOL(). That's it.
> +#
> +# However, some headers include <linux/export.h> even though they are co=
mpletely
> +# unrelated to EXPORT_SYMBOL().
> +#
> +# One example is include/linux/module.h. Please note <linux/module.h> an=
d
> +# <linux/export.h> are orthogonal. <linux/module.h> should be included b=
y files
> +# that can be compiled as modules. In other words, <linux/module.h> shou=
ld be
> +# included by EXPORT_SYMBOL consumers. In contrast, <linux/export.h> sho=
uld be
> +# included from EXPORT_SYMBOL providers, which may or may not be modular=
.
> +# Hence, include/linux/module.h should *not* include <linux/export.h>.
> +#
> +# Another example is include/linux/linkage.h, which is completely unrela=
ted to
> +# EXPORT_SYMBOL(). Worse, it is included by most C files, which means, m=
ost C
> +# files end up including <linux/export.h>, even though only some of them
> +# actually export symbols. Hence, include/linux/linkage.h should *not* i=
nclude
> +# <linux/export.h>.
> +#
> +# Before fixing such headers, we must ensure that C files using EXPORT_S=
YMBOL()
> +# include <linux/export.h> directly, since many C files currently rely o=
n
> +# <linux/export.h> being included indirectly (likely, via <linux/linkage=
> etc.).
> +#
> +# Therefore, this check.
> +#
> +# The problem is simple - the warned files use EXPORT_SYMBOL(), but do n=
ot
> +# include <linux/export.h>. Please add #include <linux/export.h> to them=
.
> +#
> +# If the included headers are sorted alphabetically, please insert
> +# <linux/export.h> in the appropriate position to maintain the sort orde=
r.
> +# For this reason, this script only checks missing <linux/export.h>, but
> +# does not automatically fix it.
> +check_missing_include_linux_export_h () {
> +
> +       git -C "${srctree:-.}" grep --files-with-matches -E 'EXPORT_SYMBO=
L((_NS)?(_GPL)?|_GPL_FOR_MODULES)\(.*\)' \
> +           -- '*.[ch]' :^tools/ :^include/linux/export.h |
> +       xargs git -C "${srctree:-.}" grep --files-without-match '#include=
[[:space:]]*<linux/export\.h>' |
> +       xargs printf "%s: warning: EXPORT_SYMBOL() is used, but #include =
<linux/export.h> is missing\n" >&2


xargs needs the -r option.



diff --git a/scripts/misc-check b/scripts/misc-check
index 51a5841673f7..c421c6cad476 100755
--- a/scripts/misc-check
+++ b/scripts/misc-check
@@ -47,8 +47,8 @@ check_missing_include_linux_export_h () {

        git -C "${srctree:-.}" grep --files-with-matches -E
'EXPORT_SYMBOL((_NS)?(_GPL)?|_GPL_FOR_MODULES)\(.*\)' \
            -- '*.[ch]' :^tools/ :^include/linux/export.h |
-       xargs git -C "${srctree:-.}" grep --files-without-match
'#include[[:space:]]*<linux/export\.h>' |
-       xargs printf "%s: warning: EXPORT_SYMBOL() is used, but
#include <linux/export.h> is missing\n" >&2
+       xargs -r git -C "${srctree:-.}" grep --files-without-match
'#include[[:space:]]*<linux/export\.h>' |
+       xargs -r printf "%s: warning: EXPORT_SYMBOL() is used, but
#include <linux/export.h> is missing\n" >&2
 }

 # If you do not use EXPORT_SYMBOL(), please do not include <linux/export.h=
>.


--=20
Best Regards
Masahiro Yamada

