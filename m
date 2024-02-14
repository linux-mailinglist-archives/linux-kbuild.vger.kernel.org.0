Return-Path: <linux-kbuild+bounces-937-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A58EB855210
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Feb 2024 19:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D88961C21414
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Feb 2024 18:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E29112836B;
	Wed, 14 Feb 2024 18:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oSkPOZUN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78619127B43
	for <linux-kbuild@vger.kernel.org>; Wed, 14 Feb 2024 18:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707935312; cv=none; b=FeMjWOBJhAhLNfQqlMTNhtBY2Z0FDlkz3VNO2ZWGCd5YgdBs5PuV2V+E1Aaknwg7JY02JeiZo9dkGa/+H74dO36pJviFFgLG/dumg0FEGxQFyBGubvxTC93XaVnRb1Qj7JepneNNCLu4G47X3HztIU4aEh8nF10wOGeTHZuhxTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707935312; c=relaxed/simple;
	bh=L1cQy5vPjEPPvGhy+Pjr6Faj2fP17lsqUJrqsKN8S9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wt7y+saxRncrozIcHHR6ondjLxettqds5hTsIIUfqo5Lbp13wMv44WBEoW0FnxFnl5NcYF8RUbxV0IaWH3HRr6YyOuJ19TtI4+mNMc2Ykd7Lr6Hce+jrDNYTSQPGtakSegzAKJ5mWYWUsgIoeF3Zs8Y2yTKul+U//5+9XFo/Gpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oSkPOZUN; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7bc332d49f6so279779339f.1
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Feb 2024 10:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707935310; x=1708540110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UXG7T3GS6T6xydEvB7aK25Z8yMzmDQXeLDbtiaZDxqs=;
        b=oSkPOZUNBtxhJwGTWvUQRphtjU/1jpT4HhpjoQEhZlli5yWNvbvi08XloElDiJ6lXP
         yC0CvAby3nvZfUySXDzTtBQ6hapF/JolRFZR7EJMIfvRpNICmKA40RHn+fSr5Q/8RTFE
         wD3MX9LpDPxxHEHkbOpLCVHqsMP4f4++d1bKJZ45BJBdjRG9LWLZwDqRtc5LtgX18Ui7
         TTUF9LqREFVttmniOQ13+8VlrWQdj/p3D8svkGwlGyBPKkMJ3wXIhFvsiXOb9sWwbvs1
         +jjowwu7Oc0ByjILel4fuRfALLm43SuXMe2h9bXjWkOSZeKriJ2lZZ1udYXtF674A0Gh
         Xnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707935310; x=1708540110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXG7T3GS6T6xydEvB7aK25Z8yMzmDQXeLDbtiaZDxqs=;
        b=X5noEqMdD+d/1N28U3pmPjfDxM8VoRKBrEWU8GUTFCqvGBLt4lFAINJvilaFWHasPk
         +m+UcMroKs8gj99fR0NpdAARTLuLEvTkR6kOS7Bq/x86BM5N9nYMsPu8GO84hO+EdYZt
         Aq7bUoiMefKdJ9PmadozVeZIim+WEZwhhJA59mlgVvDwtlayRfyKdY9mRZWkQUZ+5xFw
         og29vSaFjI1ZNV04FS5SoUmJY2II8zEobG67weEE5dxS3C6xEoW6T/M40H3ImgbOg2qL
         hjUBL9H7IO3IXYjiAPrzHD8f8N7P613iUTJdELewqkbb38uuBCcgRIP9ckoHkOsDVaMw
         BL/A==
X-Gm-Message-State: AOJu0YxJ1I1y3kCqthKX9wbVEUXlhAmAPn+loAzVfpiMW5Htq8Wv9Fp8
	F1dg17xy89txJdg2V0j8joznYUfvmGZuAhkizNxzumn2xY2EAQfpr1WNLfnJpA==
X-Google-Smtp-Source: AGHT+IEiKlUZY2svl3CmYmFiwFlC+HtEN+d+i2JVJ8GIWshr6QOje2I94cpJFsJpFiYgYD/MtRPDGg==
X-Received: by 2002:a6b:6610:0:b0:7c4:3b9e:f766 with SMTP id a16-20020a6b6610000000b007c43b9ef766mr3533717ioc.20.1707935310529;
        Wed, 14 Feb 2024 10:28:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULDYdhHx0Tim9oaW2CeKEN3+wa2WE1J8k3qfIEDy1/Ves/fXZMA/ZWBlP5PgV1w0P8rIpJB1y6ffKeoDGwOZVUZd9CsF7FksR3Zxw3fhk4pPv7TxK25e1Mk0DB0fS0HcVRLqaAr9SfKgSAmZk5XVSXqECQnkBQf5U3Hgwvm7q+lIwy/QzTP4MK7A2h21mI+orjPXohcdbsIBwaRnqRmCoouz0GN7jHTnNnpvFj8fpoHQn7UL1ZT2xO0oOum7GXMFfQWpSYx8RxdpIycXZB0bB0ieQNAqcrYK4rdsIrlF6+fhJ9/CgR1KgpH2qSLp0PoZ3Ddwn6+n96sw9CDNWWUcBD7igadr0WKJliD2kf2Zf4EfbKxPk=
Received: from google.com (20.10.132.34.bc.googleusercontent.com. [34.132.10.20])
        by smtp.gmail.com with ESMTPSA id a22-20020a6b6d16000000b007c45ab3dc34sm2131730iod.29.2024.02.14.10.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 10:28:29 -0800 (PST)
Date: Wed, 14 Feb 2024 18:28:25 +0000
From: Justin Stitt <justinstitt@google.com>
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	masahiroy@kernel.org, morbo@google.com, nathan@kernel.org,
	ndesaulniers@google.com, nicolas@fjasle.eu,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v3 1/1] gen_compile_commands: fix invalid escape sequence
 warning
Message-ID: <20240214182825.ghe2rqux4mdkgh2f@google.com>
References: <CAFhGd8pvhzehMGh1XEHBct7CGEQuF0CZeneMH3D6cKSRj5UdHQ@mail.gmail.com>
 <20240214012439.879134-1-andrewjballance@gmail.com>
 <20240214012439.879134-2-andrewjballance@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214012439.879134-2-andrewjballance@gmail.com>

Hi,

On Tue, Feb 13, 2024 at 07:23:05PM -0600, Andrew Ballance wrote:
> with python 3.12.1 '\#' results in this warning
>     SyntaxWarning: invalid escape sequence '\#'
>
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>

You probably don't need to send a patch series (with a cover letter) if
you're only sending a single patch to the list.

Really, though, who cares!

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  scripts/clang-tools/gen_compile_commands.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 5dea4479240b..e4fb686dfaa9 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -170,7 +170,7 @@ def process_line(root_directory, command_prefix, file_path):
>      # escape the pound sign '#', either as '\#' or '$(pound)' (depending on the
>      # kernel version). The compile_commands.json file is not interepreted
>      # by Make, so this code replaces the escaped version with '#'.
> -    prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
> +    prefix = command_prefix.replace(r'\#', '#').replace('$(pound)', '#')
>
>      # Return the canonical path, eliminating any symbolic links encountered in the path.
>      abs_path = os.path.realpath(os.path.join(root_directory, file_path))
> --
> 2.43.0
>

Thanks
Justin

