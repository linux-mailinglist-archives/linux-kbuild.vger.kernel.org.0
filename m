Return-Path: <linux-kbuild+bounces-999-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A98E85B0B2
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Feb 2024 03:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAE70282DB4
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Feb 2024 02:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2863D38F;
	Tue, 20 Feb 2024 02:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WgMAA/ST"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B22C482D0
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Feb 2024 02:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708394607; cv=none; b=A8NjbTX/aXCFEZwv37bki//nDwT48vllPgAl2cPCfi14VXdcHip5qRsE85D98qAcy3tDxv+/UdmS9G/RxIzdxu8s7OXhvX46vRgMO9rwuQ17Y7NJGw4e4wFcNqStbG+Uyn9/r2k6xrQO4o+mugr9+Pi8LPJtgGgTniADk3hAles=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708394607; c=relaxed/simple;
	bh=Gnb6UeNF8wLVhpCMEWjPwUvIUTFBjSPitOiRpAHZyvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r6OWASDnIY8rBlRs2K6vvuio67XSbQbAN23DbVgEQu3ceF0QoWKY1N9KXYEi37rtLQCVXUZe0YUO5s8XPeeJDT1LWqlYxqmfIJ+65nlWt93uy0aii8ioVGdh2AHpWm1jjyk1AtQ6b54f8SnvGOUZfx1g7S9LmUY1rM7PdBYu3CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WgMAA/ST; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6818a9fe3d4so30956216d6.0
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Feb 2024 18:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708394604; x=1708999404; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gnb6UeNF8wLVhpCMEWjPwUvIUTFBjSPitOiRpAHZyvo=;
        b=WgMAA/STiB/qvfjvjrG/jJSQULFr1MXAdizCjimynkmkLV7KrPbwCRuiqj+eFWlZey
         ENK+1pkkxNEnwLdt1jtnWdI/w26SjOALewXfv6MzeG6c3nNYUuMCOcjGHyoC7Ghki3yN
         407vB36XgASQLg716JXns1FdQ1183fA3seAMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708394604; x=1708999404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gnb6UeNF8wLVhpCMEWjPwUvIUTFBjSPitOiRpAHZyvo=;
        b=Nn4np33TO/Tay7KOMZK5A0mpo4+vT2MnchxDpxL2eM+70D6ySr3aP8yjxWL1PwslJA
         3llm1bkD3xdpB/tLtFYAK52QZWY1uFlb9HzLCnbxwSSvyguOazUMveruxMapPm/XOhMz
         w+BagNMtI4UmTTCVKnvdW5Id8EyasU6NPpp6ab5RrL3QSYt1r8Mn5UFotwHn/wdrMMjA
         HpXSeRCDdtvcSiNX1rrqJKAgVFBP5prfcOxnN7eezXbfU86e1tUNUOIqd4aqqCOAGT2b
         6ITtjggWj6TO9YOJRMaAoWho169UFVaJo/Lvyrj9z3ZTWCqsD61yV8YGv0qPYwez1mqs
         3ufw==
X-Forwarded-Encrypted: i=1; AJvYcCUdK0srQ2wkkIKhfpLatc6DxFAtNLbRTsA8CnFiMq8HpJVjHXzS6e3jufFMTHcFrE0MSRpOJgYLz8p4oz0rLUO3pnwmD7gZdBMDlNSO
X-Gm-Message-State: AOJu0YyxK35FOMtu1kICTqR3fSgEKJKiGVpTkM5D267htKXAGj03Lzck
	6LnxEW6J0NEG3eAMXmXrTNs3vsjeip6Mnij4+QWl2qTqx7xDys21fh5BETCz45n6QMmA9yo+jC+
	teZblZni9rxi18rdjrheDvxNAOhAAETwRywIU
X-Google-Smtp-Source: AGHT+IGF6BQP5pn2526eKzx1V1UxSN69r2M8tzxCVxzYihvQCKzBXtYAv8IY9wOCr55gIl0rUtAWPW+D8gzwvDmYkHg=
X-Received: by 2002:a0c:e34e:0:b0:68f:301b:548b with SMTP id
 a14-20020a0ce34e000000b0068f301b548bmr9381595qvm.0.1708394603974; Mon, 19 Feb
 2024 18:03:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202173034.221790-1-sjg@chromium.org> <20240202173034.221790-3-sjg@chromium.org>
In-Reply-To: <20240202173034.221790-3-sjg@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 19 Feb 2024 19:03:13 -0700
Message-ID: <CAFLszThi29VCh2rKzvouW6rSpLq5E=uOzWLASO2-CE3Jw_1NUA@mail.gmail.com>
Subject: Re: [PATCH v10 2/2] arm64: boot: Support Flat Image Tree
To: linux-arm-kernel@lists.infradead.org
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	Will Deacon <will@kernel.org>, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, 2 Feb 2024 at 10:30, Simon Glass <sjg@chromium.org> wrote:
>
> Add a script which produces a Flat Image Tree (FIT), a single file
> containing the built kernel and associated devicetree files.
> Compression defaults to gzip which gives a good balance of size and
> performance.
>
> The files compress from about 86MB to 24MB using this approach.
>
> The FIT can be used by bootloaders which support it, such as U-Boot
> and Linuxboot. It permits automatic selection of the correct
> devicetree, matching the compatible string of the running board with
> the closest compatible string in the FIT. There is no need for
> filenames or other workarounds.
>
> Add a 'make image.fit' build target for arm64, as well.
>
> The FIT can be examined using 'dumpimage -l'.
>
> This uses the 'dtbs-list' file but processes only .dtb files, ignoring
> the overlay .dtbo files.
>
> This features requires pylibfdt (use 'pip install libfdt'). It also
> requires compression utilities for the algorithm being used. Supported
> compression options are the same as the Image.xxx files. Use
> FIT_COMPRESSION to select an algorithm other than gzip.
>
> While FIT supports a ramdisk / initrd, no attempt is made to support
> this here, since it must be built separately from the Linux build.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>
> Changes in v10:
> - Make use of dtbs-list file
> - Mention dtbs-list and FIT_COMPRESSION
> - Update copyright year
> - Update cover letter to take account of an applied patch
>

Is there any news on this patch, please?

Regards,
Simon

