Return-Path: <linux-kbuild+bounces-924-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 073778540E1
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Feb 2024 01:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9816B1F2490B
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Feb 2024 00:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C3679CF;
	Wed, 14 Feb 2024 00:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bWc4O9R/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264877F
	for <linux-kbuild@vger.kernel.org>; Wed, 14 Feb 2024 00:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707871233; cv=none; b=DVUz829WeMp9BLIITdpcVRvmkpXnybCvOy5tRQKt3P4SAWTjcBx0Sez3kMcPFDDc1BnrRsyBnX/v3XC25HrcSHDFammWVjJhU1xAHq87gFPG5Xp2AhUZ6pZ74zpq2x6b625nCXhh3CUL7ejNt0XnBHKg+VO6lAN/7rUJ4w7TGUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707871233; c=relaxed/simple;
	bh=732+Z96bjl+fssXUyJzSLJfOmRgK7uvzPvL/AgukfWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWarUceW/Tm6XDfQI0fnNcV52KAk0CQyPGi36IM0ISVGKAI9iiIwS0rM7ORJuhCg0ke3QW/7cE3O9Jdlar+kqU9udiDoDjDCgX+C94jlg25gdSHu44JBcaRdY2uK/YgNPggEPXZG8+w0neR+2KW2kvlS9hBz5h/hAgumMVvJjao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bWc4O9R/; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d0cdbd67f0so70335881fa.3
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Feb 2024 16:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707871230; x=1708476030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odl7g7SmrflKYLXiwuyOjEG83lRHDsTab35r8GfTGWQ=;
        b=bWc4O9R/voPkoZyTgtWKWhNbFdbpEaUnVgiW+31y2nbx+DyQ6E/3m92sM5eV6y85RY
         FjGG5P1CguMgShtGPx41XsNMB/dur98eagDrQ2n70CqMbQ1pEO744+QhUdxlQ/EDP86u
         hzspTN7E6FmicVxoyYjgIZaKkdtg47MA4fxoIjuB5G99t1mQ2c2dmYatcLMzhAruENdW
         vVmgSnHqzq1cIru7FlNvJso9lQHFvUsxqo/NxOAXMjkTdPVj8TsiD0H4weSjbx3Y75qx
         +Uxkt9GtpoDui0gqEFteYQ88DkCdbv1+u3XyBrw4fx29VvA2LtUz8TG29MveHcX+YetL
         DRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707871230; x=1708476030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odl7g7SmrflKYLXiwuyOjEG83lRHDsTab35r8GfTGWQ=;
        b=GNzKWOjUSuNQFdNHr9DCwok7z+hpOzG9K4aCpX5fiAd1GJ2zhVdh8v04mA+HMhph1y
         czczvvkmiW2HqczfoOECYCGpN52/8gXPNKWIwNq1jzqXu3qXo/deuLbECx/7BELq3vvO
         QjD9h9NlQcLGqLOHZI6U/rIBRo4g7WlTL5+b7dxmkBIFsJSfDTEABF+LpL3Kcztm8hai
         9H/MkSam7RCZW0Wrxdj01PbosNWLiAgNR1eighDR9qUnzYYyNYDw+3ZhqLIyj98ZXrbw
         1f8QVH3UlieUXiy6/7GfSY4+Bak4906rFQol3c+ZUlzVfKZGfJJ4nVfhgSfCLPSgjaWK
         Q2Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVhLgNDuAyepscMznp4gJFc9YB45m2NlKDrePDXWjN6t9LeBM/SlNFrZzKmTcqp7eHsZE+lp/EwDrAhgKlQ65C4J78vPiQjIF9A2eYr
X-Gm-Message-State: AOJu0YxJ4kSt/0l/aycvrEBvwgdOLLXbZeU7U+FapjhuBkMizPcFNajE
	8FbTKYIyXgGqJNlwqwrD+DxvPhUq44yzoBDocE69rW/9OYBktiTY7CT/Fx2pcDRdc/BcFVn08/9
	8VYm2r4pn4fyKNXpYnq7ejoYGbwcVvzVWNnX7
X-Google-Smtp-Source: AGHT+IHaUEkMIsoH9jlZggCVr/lZg/wX9gXvgpogBKJNvdQOntkz1p+0QQQ+q3X5bOtAgqrr5xeujEeC8XfnyLaucL8=
X-Received: by 2002:a2e:7c06:0:b0:2d0:e36a:6424 with SMTP id
 x6-20020a2e7c06000000b002d0e36a6424mr956016ljc.35.1707871230071; Tue, 13 Feb
 2024 16:40:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNARaW1V5X79BFW5_YTKY+n+OSp+_ACpRxpiw+VOJ+2hf=g@mail.gmail.com>
 <20240213022552.754830-1-andrewjballance@gmail.com>
In-Reply-To: <20240213022552.754830-1-andrewjballance@gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 13 Feb 2024 16:40:17 -0800
Message-ID: <CAFhGd8o10KWEX=H56kUN0hjY=fowijov0bn+j_kOmv6BPwJ-yw@mail.gmail.com>
Subject: Re: [PATCH v2] gen_compile_commands: fix invalid escape sequence warning
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, nicolas@fjasle.eu, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 12, 2024 at 6:28=E2=80=AFPM Andrew Ballance
<andrewjballance@gmail.com> wrote:
>
> with python 12.1 '\#' results in this warning
>     SyntaxWarning: invalid escape sequence '\#'

Yes, since Python 3.12 escaping invalid characters will result in a
SyntaxWarning.

The complete table of supported escape codes is available here [1].

>
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> ---
>  scripts/clang-tools/gen_compile_commands.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-=
tools/gen_compile_commands.py
> index 5dea4479240b..93f64095fda9 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -170,7 +170,7 @@ def process_line(root_directory, command_prefix, file=
_path):
>      # escape the pound sign '#', either as '\#' or '$(pound)' (depending=
 on the
>      # kernel version). The compile_commands.json file is not intereprete=
d
>      # by Make, so this code replaces the escaped version with '#'.
> -    prefix =3D command_prefix.replace('\#', '#').replace('$(pound)', '#'=
)
> +    prefix =3D command_prefix.replace('\\#', '#').replace('$(pound)', '#=
')

I'd personally prefer using a raw string:
-    prefix =3D command_prefix.replace('\#', '#').replace('$(pound)', '#')
+    prefix =3D command_prefix.replace(r'\#', '#').replace('$(pound)', '#')

This makes it clear that a literal backslash followed by a literal
pound sign will be replaced.

>
>      # Return the canonical path, eliminating any symbolic links encounte=
red in the path.
>      abs_path =3D os.path.realpath(os.path.join(root_directory, file_path=
))
> --
> 2.43.0
>

[1]: https://docs.python.org/3/reference/lexical_analysis.html#index-23

Thanks
Justin

