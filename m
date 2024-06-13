Return-Path: <linux-kbuild+bounces-2120-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E93CE907675
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Jun 2024 17:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EBC31F21F5F
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Jun 2024 15:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB5C149C45;
	Thu, 13 Jun 2024 15:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d5sbq6c+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E721144312
	for <linux-kbuild@vger.kernel.org>; Thu, 13 Jun 2024 15:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718292158; cv=none; b=LBZNc/j4kadpdSimuOPCXtlFTIOZ03xdOVctWvSbDMPOyEInHAwqNzhQ4FfpjP1Q4u6xaJx+X5Yyknb6el7HBrc2kxkvvwyDM0uhKN+6Z7DY1rKHixEBf+NKlYAdeYNOclkMSXzIsC5Uy5rDJCKwG5lzY/TtbY+lbLD018r5apQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718292158; c=relaxed/simple;
	bh=n4hXsXgUNly0dvZL2DEJYivRYjI1ORhlqA7s2/ruvis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZhFiB4iXE2q4HSKovMMYAc0hH8uIjwrClMJqcCrLmDq9UEb813J9Yg22HgMd9O/fvho/Oq9GxGkLCVK9eU6RoImzGPOEBiQA0mt18qiugSDC4DeApEoYgl0b6/MVT1wae3HhxUrhDlnFnevfcbwaAL9uOwS59sGDsxTRM5AqM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d5sbq6c+; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6ad8243dba8so5629066d6.3
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Jun 2024 08:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718292154; x=1718896954; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c1FwXGbPrFXal5e1NPPyrNFtuM5Jb5Wk1WnrPz9CJ3g=;
        b=d5sbq6c+Ln9ohEJetSbmbITgkXLfYXo3TH2XJiZv7uqd7Y48X+qrPgc5XVgeP4McGI
         wOi+I40pbwUij3Dx3JCuIKXF9LeDVhh+Qm0UN3wDucL343aTN8JNdn+58n2HgSgDEEVL
         d/hg1oppE/hIizHKJbA5+j8RBY+XHuhjF/gTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718292154; x=1718896954;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1FwXGbPrFXal5e1NPPyrNFtuM5Jb5Wk1WnrPz9CJ3g=;
        b=M3a6TDFIH4gsliiA8KH+VGejFvDYWIkh/h8v9piTbMTXQ7lbET99qxWQwYWUE26HUx
         wpM8L0Hr9v7bBFcbrbe8yuVrar1FcaysOLMOvkHXMv8qBj4TQKhmWQCpGEwZVywQPO77
         g7GUxEBCOSkyKWGOoSvjxccTfTWaVnhhS3B0EjXxibKXi+mYtJMtZ7v0HC/hEcBpTO7Z
         Rq6Y69d91syuOOplahKggM1qsbcSklqukTqKn1E7iCJsTi/GG8XzpGdMHni25vh3+AwK
         ZNBVW6XxQK7cpdJuiPRWa0gGx+bKxvVacOd0/DSKyMCtU5T8rZuzqXTS9J1NTKX3wUy/
         GjaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0JDno+SRIfO9NIAKZS1powoUsodkXSfVauMNhF86SxoMBi51eCuANmvhHJif6cXFMXKF9jbUg1Z6p55EX6pX2lcXZBABfWEU4a+5a
X-Gm-Message-State: AOJu0Yx6dBHqHvomyrTTIEDIm1C6cb0fZBtPL0iT08384/aPH6okw1VW
	p7rz/4P/e14fT0wydvrGZTH8ZC5PTlgHtgMIkqPXUXKLUJo4ELwYrFdQ3ljF/crXPv3CqRjggaw
	Zop5tGw579a8hbNKk/OED8wlm5WHeM7N2goWFR41XlYelpJ4=
X-Google-Smtp-Source: AGHT+IEa7ob5SUFmAeY7t+jsiZ0g0b24xhK3WVy8G0Zs4wQMtVzABwezXEypz7uuOagcfWUSmCPfVFLB/TFN5YhaLvI=
X-Received: by 2002:a05:6214:3a82:b0:6b0:74cf:676c with SMTP id
 6a1803df08f44-6b1a77f12e4mr68951216d6.63.1718292154251; Thu, 13 Jun 2024
 08:22:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613093433.131699-1-wenst@chromium.org>
In-Reply-To: <20240613093433.131699-1-wenst@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 13 Jun 2024 09:22:23 -0600
Message-ID: <CAFLszThZ0SKMVhK_DPxq7n+DavBbWLxit0P3R=o7HN7UcTrPvg@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/make_fit: Support decomposing DTBs
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Jun 2024 at 03:34, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> The kernel tree builds some "composite" DTBs, where the final DTB is the
> result of applying one or more DTB overlays on top of a base DTB with
> fdtoverlay.
>
> The FIT image specification already supports configurations having one
> base DTB and overlays applied on top. It is then up to the bootloader to
> apply said overlays and either use or pass on the final result. This
> allows the FIT image builder to reuse the same FDT images for multiple
> configurations, if such cases exist.
>
> The decomposition function depends on the kernel build system, reading
> back the .cmd files for the to-be-packaged DTB files to check for the
> fdtoverlay command being called. This will not work outside the kernel
> tree. The function is off by default to keep compatibility with possible
> existing users.
>
> To facilitate the decomposition and keep the code clean, the model and
> compatitble string extraction have been moved out of the output_dtb
> function. The FDT image description is replaced with the base file name
> of the included image.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Replace OrderedDict with standard {} dict
> - Change short form command line argument to -D
> - Drop [] around "'fdt-{x}\x00' for x in files"
> - Add spaces around '+' in slice argument
> - Split out DTB parsing into separate function
>
> Simon's reviewed-by was dropped.
>
> This is a feature I alluded to in my replies to Simon's original
> submission of the make_fit.py script [1].
>
> This is again made a runtime argument as not all firmware out there
> that boot FIT images support applying overlays. Like my previous
> submission for disabling compression for included FDT images, the
> bootloader found in RK3399 and MT8173 Chromebooks do not support
> applying overlays. Another case of this is U-boot shipped by development
> board vendors in binary form (without upstream) in an image or in
> SPI flash on the board that were built with OF_LIBFDT_OVERLAY=n.
> These would fail to boot FIT images with DT overlays. One such
> example is my Hummingboard Pulse. In these cases the firmware is
> either not upgradable or very hard to upgrade.
>
> I believe there is value in supporting these cases. A common script
> shipped with the kernel source that can be shared by distros means
> the distro people don't have to reimplement this in their downstream
> repos or meta-packages. For ChromeOS this means reducing the amount
> of package code we have in shell script.
>
> [1] https://lore.kernel.org/linux-kbuild/20231207142723.GA3187877@google.com/
>
>  scripts/Makefile.lib |  1 +
>  scripts/make_fit.py  | 86 ++++++++++++++++++++++++++++++++------------
>  2 files changed, 65 insertions(+), 22 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

