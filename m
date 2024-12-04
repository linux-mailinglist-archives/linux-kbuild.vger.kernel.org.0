Return-Path: <linux-kbuild+bounces-4984-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 923EF9E30A5
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2024 02:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AA2416118D
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2024 01:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8C58472;
	Wed,  4 Dec 2024 01:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/K11b0Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ECE63D;
	Wed,  4 Dec 2024 01:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733274725; cv=none; b=f31a1E0KfVlbTfOiXGGbfqM63cqhoXFf14YeNpDs9F5sdP6bcF5F626YUUkuVOCwF8lUgyoxz9hp4YW6qA+A2WAtKKsyqvwqEqYA8W1tcHxBl57+SdX7zUiyTJalbao3RJTmEZl0D9+0olD411S3fJJyF4xw3Evh0fRqX/CbEEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733274725; c=relaxed/simple;
	bh=763Q33cesnFLz/F287OyxBs3fuu5TUB7AZvEBp0vBAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7s7sFLIMGsFqDKMu95uWtzPRXXRfPjJGpMRJn+ReaNpkjuwCxyhY7Ic0Zsm1/3A05ECgJNVWIqy2fHwgGfqnJR1Pz6xo0CvlqvDjS7zI+qUJ04jw5QsW83GsJne/bF5k/Eb28DfGUkrO62I+jZkHA6WXcGTNCQPo3YicBxmZkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/K11b0Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA73AC4CEE1;
	Wed,  4 Dec 2024 01:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733274724;
	bh=763Q33cesnFLz/F287OyxBs3fuu5TUB7AZvEBp0vBAk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o/K11b0QVleBbg0StRpJxsDY1TO1ONOycjeTFN8/lhyzeAsGIAEoA7BzdAFykkR8G
	 pMMIJpznop/TmCW2UMXrHNm4GfipO+nRPKBlTbSnqpUft+SBNwggXNNm912G713Nuq
	 Jo48EhhOFPM+VERFTOOEzy+Z60hC2278uZY8TNvCl8LhLNDEd/wwuVphLEDmIlxfjI
	 cjJp9m7CDve0z/Qj3Ouh1LVOwHYTKMO3xPUTLjFlI9HcOTEY34EgOOqlLbKRfDu9LE
	 GxdIyLT34HslJcaD9JUiarRVTH4XzGUqibizO8NAnpGEIZEKsTDi1pGdNaUp9tpF5E
	 YyqSjze1SMTMw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53df80eeeedso6366215e87.2;
        Tue, 03 Dec 2024 17:12:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZrFmZz6K257oIuoT17Wyek53fXoR6S48Y6B2sxu9t8peq5uzMCyLn1qHWCmadElEqA7YFM9W4ibaM2PH78Q==@vger.kernel.org, AJvYcCVqVsl54TFRURIsGxmb9p3SF4f71uLayI+wfQkhxmRa2yB+dHtzsiVpU2TLQQvz12A5OmNUOS+3Ef8Wb2NB@vger.kernel.org, AJvYcCVvG211z51Ng8hDmw7hoUULyAsyjdF2Zqi4FuPlLej4Rsl0wjbCTHjEtdPiYV9xC/2D1G4pF9VVo12+Bg==@vger.kernel.org, AJvYcCWmeDVcFcawmnbdMTYUoKuKMeL99jrqY2nxTAIlvJytivape37Lt2QiPhwBCnQHKy8gT13zB1f25mCPMfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCwKm2/iHOW2s6yzAsQtWg+QVkQ/QY4x4pqvWk0iLShrhPcAYD
	V+psutk7G+bOOx7CkzEBO9t2ZXvhLEH1mINAO2rxV+fmnoO7ncQXrDvQThv6e6nRuYVEVBkp4MF
	4F+Q/my9U/GZhQjT3K0Ww4BoW+nw=
X-Google-Smtp-Source: AGHT+IGP7jCsBuS29VUw55WfMqwUrppo+WokdJLiuLvhcPQEbTEYDMMfP6oFn+2xAWP/c+lLBU+OkaEYPcfRMPKGqm8=
X-Received: by 2002:a05:6512:2252:b0:53d:ab0d:b9ef with SMTP id
 2adb3069b0e04-53e12a27675mr2301885e87.43.1733274723002; Tue, 03 Dec 2024
 17:12:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202145946.108093528@infradead.org> <20241202150810.048548103@infradead.org>
 <20241202151533.GF8562@noisy.programming.kicks-ass.net> <CAHk-=wh7KugYO+R-1DMmkLz4fD_-A9BMyrWTVsH_K0a86Ojn4A@mail.gmail.com>
 <d707cb3b-1569-45d9-bdc3-dcc98eb88bc4@sirena.org.uk> <93a900b2-7740-4bfa-bfac-1ec2e5bfa383@sirena.org.uk>
In-Reply-To: <93a900b2-7740-4bfa-bfac-1ec2e5bfa383@sirena.org.uk>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 4 Dec 2024 10:11:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ5Y5HN7UZU2JhW9Yvqkp1ye4NMzHce-2pCnPSRNANX7g@mail.gmail.com>
Message-ID: <CAK7LNAQ5Y5HN7UZU2JhW9Yvqkp1ye4NMzHce-2pCnPSRNANX7g@mail.gmail.com>
Subject: Re: [PATCH -v2 1/7] module: Convert symbol namespace to string literal
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, nathan@kernel.org, 
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	hch@infradead.org, gregkh@linuxfoundation.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 7:06=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Tue, Dec 03, 2024 at 07:20:05PM +0000, Mark Brown wrote:
> > On Mon, Dec 02, 2024 at 11:33:58AM -0800, Linus Torvalds wrote:
>
> > > If we have these kinds of big scripted things, right after the merge
> > > window tends to be the best time to do them. The conflict potential o=
f
> > > leaving it hanging in linux-next can be somewhat annoying. They may b=
e
> > > fairly unlikely, and easy to resolve individually, but it's one of
> > > those "one is trivial to deal with, but even just a handful is
> > > annoying".
>
> > > So I'll run your script and take your commit message, and we'll have
> > > this part over and done with.
>
> > I *think* this is interacting in a fun way with at least the IIO
> > subsystem in -next (Linus' tree is fine, I didn't do too much
> > investigation as I'd quite like the -next build to finish some time
> > today):
>
> Yes, this is breaking ASoC and possibly other things as well.  I guess
> any tree adding a new use of these macros needs to merge mainline to
> avoid a mess here.

In this development cycle, I think subsystems should queue up patches
on top of -rc2 instead of -rc1.


Meanwhile, linux-next needs to carry the following fixup.


diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c
b/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c
index 550cc53e7559..f415f300afb6 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c
@@ -908,4 +908,4 @@ EXPORT_NS_GPL_DEV_PM_OPS(inv_icm42600_pm_ops,
IIO_ICM42600) =3D {
 MODULE_AUTHOR("InvenSense, Inc.");
 MODULE_DESCRIPTION("InvenSense ICM-426xx device driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_INV_SENSORS_TIMESTAMP);
+MODULE_IMPORT_NS("IIO_INV_SENSORS_TIMESTAMP");




--=20
Best Regards
Masahiro Yamada

