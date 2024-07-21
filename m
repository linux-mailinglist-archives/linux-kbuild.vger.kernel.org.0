Return-Path: <linux-kbuild+bounces-2618-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D18CB9386A0
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jul 2024 01:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0702E1C20984
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jul 2024 23:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AAC1119A;
	Sun, 21 Jul 2024 23:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+AD9s1O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EE710A0C;
	Sun, 21 Jul 2024 23:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721603417; cv=none; b=P6bF2+L5e918p0IKy+8cw1TEwpZSvuALqVOOiaTvDYTcg0Jz0mezOsTLt+CRTzfCfUAqkLaDPFjsLK/qBd6WAGj+CXrhbwg4OeYoxUf33xJsqeeEftzA9I3gqwM8367NVUyhFrCtKO8udgGhAN/R+7mbUjpU4/CZCwc5WX0mgVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721603417; c=relaxed/simple;
	bh=bw+VvhlF0vZLry6Yx1OT7P3zYLo5EWWOODFGnE6NXKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMeFX+zsIfLpRzCLqlV1ZFmLibdPq1EfAQkkpXWFb/85YdXsiQCe2ckx43ieVNYsmwfqWb+ntIER/521paMv9cwOsXcK1wf4N73xwA2xDLo/mW8Q8vx1bzbDaWh4OyDS64ZAXBlXmwqgo5z0WSjuJjiCd453IXukV1XtngU35Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+AD9s1O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3995EC116B1;
	Sun, 21 Jul 2024 23:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721603416;
	bh=bw+VvhlF0vZLry6Yx1OT7P3zYLo5EWWOODFGnE6NXKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+AD9s1OlZ1radzKjhu5pCExQ5gPuD5aYt2osC0mWdHJTU5I+8Ml0yYaoKpv2xjoX
	 r4RBUNLfOqM0bnCVOCfaxJgzZr+RFKl13qwZT6vM79uAHLixOhZvR2lmwf6GBIZ2gX
	 y1Sa6SzlrKh9VfC4C5d5uyYgrZxFIL8JUimZyR6t4rZWZWpugwvZBAB7MMTzDfbLXb
	 tvsLKXGaHkR1HPysCg5Kn2X8HSTL0WWVUqZOXVxwnEWb0oW0BIfAzsaMEb0Nz53qsT
	 6zzjyjg8Zb5B9u2LtRBKJ/5YJ28svRUgdc9ollLn4LV2GYOgX+BuT4L0zJXF19qlif
	 yFoGvcYZUwDAw==
Date: Sun, 21 Jul 2024 16:10:14 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: =?utf-8?B?0JTQsNCy0YvQtNC+0LIg0JjQstCw0L0g0JDQu9C10LrRgdC10LXQstC40Yc=?= <davydoff33@yandex.ru>
Cc: linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, corbet@lwn.net,
	masahiroy@kernel.org, nicolas@fjasle.eu
Subject: Re: [PATCH]: kbuild doc typo fix
Message-ID: <20240721231014.GA9588@thelio-3990X>
References: <1935A993-DAB0-4092-A1FE-B6501EE8E0DC@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1935A993-DAB0-4092-A1FE-B6501EE8E0DC@yandex.ru>

Hi Ivan,

First of all, thank you for noticing this and sending a patch!

I think the title of this commit could be improved a little bit. I think
using the prefix "kbuild: doc:" would be good, as that seems to be the
most common prefix I see when I look at 'git log --oneline' for this
file. This is not really a typo fix but more of a generalization because
clang is now a viable alternative to GCC, which could also be included
in commit message below. I suspect that was probably not the case when
this documentation was written.

On Sun, Jul 21, 2024 at 02:37:33PM +0300, Давыдов Иван Алексеевич wrote:
> In this part of the documentation, $(CC) is meant, but gcc is written.
> 
> Signed-off-by: Ivan Davydov <mailto:davydoff33@yandex.ru>

As for the patch itself, I cannot apply it directly from mutt or the
mailing list because it is quoted-printable:

  $ curl -LSs https://lore.kernel.org/all/1935A993-DAB0-4092-A1FE-B6501EE8E0DC@yandex.ru/raw | git apply -3v
  error: git diff header lacks filename information when removing 1 leading pathname component (line 63)

I suspect that is also why your signoff has a mailto: in it. Consider
looking at git-send-email or b4 send for sending your patches so that
your mail client does not mangle them in this way:

https://nickdesaulniers.github.io/blog/2017/05/16/submitting-your-first-patch-to-the-linux-kernel-and-responding-to-feedback/
https://b4.docs.kernel.org/en/latest/contributor/send.html

> ---
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 991ce6081e35..be43990f1e7f 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -578,7 +578,7 @@ cc-option
>    Note: cc-option uses KBUILD_CFLAGS for $(CC) options
>  
>  cc-option-yn
> -  cc-option-yn is used to check if gcc supports a given option
> +  cc-option-yn is used to check if $(CC) supports a given option
>    and return "y" if supported, otherwise "n".
>  
>    Example::
> @@ -596,7 +596,7 @@ cc-option-yn
>    Note: cc-option-yn uses KBUILD_CFLAGS for $(CC) options
>  
>  cc-disable-warning
> -  cc-disable-warning checks if gcc supports a given warning and returns
> +  cc-disable-warning checks if $(CC) supports a given warning and returns
>    the commandline switch to disable it. This special function is needed,
>    because gcc 4.4 and later accept any unknown -Wno-* option and only
>    warn about it if there is another warning in the source file.
> @@ -606,7 +606,7 @@ cc-disable-warning
>      KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
>  
>    In the above example, -Wno-unused-but-set-variable will be added to
> -  KBUILD_CFLAGS only if gcc really accepts it.
> +  KBUILD_CFLAGS only if $(CC) really accepts it.
>  
>  gcc-min-version
>    gcc-min-version tests if the value of $(CONFIG_GCC_VERSION) is greater than

Other than the comments above, which are simple process things, this
change overall looks correct. Consider fixing those up and sending a v2
and I will be happy to provide a Reviewed-by tag.

Cheers,
Nathan

