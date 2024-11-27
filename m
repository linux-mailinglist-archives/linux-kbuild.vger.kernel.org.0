Return-Path: <linux-kbuild+bounces-4904-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA719DAFD7
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Nov 2024 00:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 492E8B2162F
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 23:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D888F1922FA;
	Wed, 27 Nov 2024 23:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkhFjXzJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A404D17E01B;
	Wed, 27 Nov 2024 23:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732750267; cv=none; b=goTsmLbL+VD6kR7FpULfVLboegq8Fm9Pa5oRyPS6xqoNASkT2DRXSAKpIKhiCaTJtfhZvepzgX4wldN7gZhE5NohVom517ah1OGStv0Ov6Qbv7rMCzKEk1A4Wh8C4aaAIVvIakk+yTemQEAZIoVWrGinLLVoAttO5Vq+0um3RSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732750267; c=relaxed/simple;
	bh=I8g1DC5LZP8BZjIWjXeeojhSJ8pwmpYmCEaMamafg5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uZ4+WvHlY8Qzns5SBhyTl7E2+TDLjtCi5xmdMF3rwcNS0mav9I0EYnC6KmXphYDY3plOGLmUCYUou5Kj0SF8OqXqxyTW81MCdtgYnGSLJNPJkAK1hZuKJmzu8DHeRvDB7NbzYLWCZi53xoi3SG4ZzrJvSH+KMM9WkgzYY9pidzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkhFjXzJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37427C4CED2;
	Wed, 27 Nov 2024 23:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732750267;
	bh=I8g1DC5LZP8BZjIWjXeeojhSJ8pwmpYmCEaMamafg5M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SkhFjXzJs+jyneVMUKx+WXFfLi2yY/2AThMvuFoHV+VVw67rIwjtZLLSFb7dPJuOO
	 vV+mVJkEUk3bA2lKKtDp+1qcd/QwukYxurlgbJheip0fmSSR4rVJpT0asrqbQy1OTm
	 N5xMLlykRGSdHFxs3RDI6W1PspGZBYaRO1gtOveqPO/nRIORDshW7zkset3trC1EFj
	 CGrFWQoVLW0sxmmf3yehRLTpRxQh6kIAg+GtaZCfz5KORyx2Ro/4uOzbVMcIbVXflX
	 JzMmlt+xG0IJWYehV6fCcpCsOJTWFoY1RRrcYDBE2NFPAGJpUGz+YYvy9k0UENMXgq
	 FBl0lt4v6GFlA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53df119675dso242813e87.0;
        Wed, 27 Nov 2024 15:31:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWHs6dUa8yYp6YTJ+k6BHSbLPr0hzn/aqvYGbfe7znjoj5IUJsxu+QRdJAxc2lvfPyzisRx/No2MkonoUeE@vger.kernel.org, AJvYcCX8aSx6Jqdw4sRcNUmnoweMgtZt7DXPU+tlLPxyC1fJxDQ5qFVQFXhc/zd/sfX1sRpCwb3LR8JZs8VLm5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIxyNwDhArVtvDlgzZ9y+aYp53xqDjVj6hBNCLHHn79UQ4vkBj
	ho0P6GPLdVjWb8UtnK33TlNJbettkhDLqkOHHmjotClKs3TGJg2RuaAv2H+ESOhtE21e0wHQcRK
	fl+8hnioSGI/PK8vWQAAsZVhen5M=
X-Google-Smtp-Source: AGHT+IHeKq6xghSLSrquNW9Jnj9KN+y1e1NElpXklaESZH2h+hG4XPl7PCTCTeTmflZu69DlnUyveQJSNjLRcJN8tww=
X-Received: by 2002:a05:6512:1286:b0:53d:e88b:eb4 with SMTP id
 2adb3069b0e04-53df00d1ba7mr2931337e87.21.1732750265812; Wed, 27 Nov 2024
 15:31:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127162904.28182-1-advaitdhamorikar@gmail.com>
 <Z0eGY_6e9jVMezxE@fjasle.eu> <CAJ7bep+s04GXoht7MuVDBZ-FsjDXgdVtk11k9ajok8SkoCwH2w@mail.gmail.com>
In-Reply-To: <CAJ7bep+s04GXoht7MuVDBZ-FsjDXgdVtk11k9ajok8SkoCwH2w@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 28 Nov 2024 08:30:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ86H7xpMqTwezXgbk8Bn273gpe9G1rmp-P0Qyzf7AJ2g@mail.gmail.com>
Message-ID: <CAK7LNAQ86H7xpMqTwezXgbk8Bn273gpe9G1rmp-P0Qyzf7AJ2g@mail.gmail.com>
Subject: Re: [PATCH-next] modpost: Remove logically dead condition
To: Advait Dhamorikar <advaitdhamorikar@gmail.com>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 6:31=E2=80=AFAM Advait Dhamorikar
<advaitdhamorikar@gmail.com> wrote:
>
> Hello Nicolas,
>
> > vsnprintf prototypes also indicate 'int' as return type.  What is the s=
ource of your mentioned findings?
> Sorry, I read an alternate vsnprintf implementation and have worded my
> patch log wrong based on it.
>
> However there is still an issue that n is declared as size_t which is
> a typedef for
> an unsigned long, I think the correct solution then is to use a signed
> data type here for n?


Yes.

'n' should be int.
This matches the return type of vsnprintf().


I will squash the following.



diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 81f20ef13a0d..5b5745f00eb3 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -49,7 +49,8 @@ module_alias_printf(struct module *mod, bool append_wildc=
ard,
                    const char *fmt, ...)
 {
        struct module_alias *new, *als;
-       size_t len, n;
+       size_t len;
+       int n;
        va_list ap;

        /* Determine required size. */



Thank you for your report!




>
> Thanks for your time and feedback.
>
> Best regards,
> Advait
>
> On Thu, 28 Nov 2024 at 02:21, Nicolas Schier <nicolas@fjasle.eu> wrote:
> >
> > On Wed, Nov 27, 2024 at 09:59:04PM +0530 Advait Dhamorikar wrote:
> > > In case of failure vsnprintf returns `pos`, an unsigned long integer.
> > > An unsigned value can never be negative, so this test will always eva=
luate
> > > the same way.
> >
> > 'man vsnprintf' on my system reveals a different behaviour:
> >
> > | The  functions  snprintf() and vsnprintf() do not
> > | write more than size bytes (including the  termi=E2=80=90
> > | nating  null  byte  ('\0')).   If  the output was
> > | truncated due to  this  limit,  then  the  return
> > | value  is the number of characters (excluding the
> > | terminating null  byte)  which  would  have  been
> > | written  to  the final string if enough space had
> > | been available.  Thus, a return value of size  or
> > | more  means  that the output was truncated.  (See
> > | also below under NOTES.)
> > |
> > | If an output error  is  encountered,  a  negative
> > | value is returned.
> >
> > vsnprintf prototypes also indicate 'int' as return type.  What is the s=
ource of your mentioned findings?
> >
> > Kind regards,
> > Nicolas
> >



--=20
Best Regards
Masahiro Yamada

