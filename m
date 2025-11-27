Return-Path: <linux-kbuild+bounces-9881-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F1910C8D784
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Nov 2025 10:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DBD234E6313
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Nov 2025 09:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5622032721C;
	Thu, 27 Nov 2025 09:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WYFUaeHT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA59326D5F
	for <linux-kbuild@vger.kernel.org>; Thu, 27 Nov 2025 09:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764234891; cv=none; b=RTVbT0Mg4k+TpP3gemLW446yvGW8hjOabuSKTQLYNfTxRn388MPBFWY6PVIOeLzVx7FPcZCyDfEuke4/DktP3ij29IEv6Exc8TwLmdndgIHlO4mbloTIR2cm1NJxYH7sPDbAZzxlbrlnWpfdKwydkUm/BUAOMiFa/1Eia3k5AQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764234891; c=relaxed/simple;
	bh=X03jox/gV8bqLBLEBTR625O9w1oSc+eeKS2ioi2DhKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jNUKZ9Vm4oTs2zKtUpnPhOCKMsEqVbu3e1YTIH04CEmQKb1b83jrePJ+1AqdwYBEZegkRsvoJWPyurG2/1BgBMrS50sHmw5PpvEf5QXhbdEEhiB7FSznfPn1NYNiVlgJMHABORIvrF76j603piUto3vyyJhPoY5gbOt0uNHk+i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WYFUaeHT; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59577c4c7c1so1626371e87.1
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Nov 2025 01:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764234887; x=1764839687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X03jox/gV8bqLBLEBTR625O9w1oSc+eeKS2ioi2DhKA=;
        b=WYFUaeHTCcZh99fNLyg4ZjCVWMHQInJ4eA1K7+hq/WQJjQDsK/MkEK+wSVvyqeuXla
         KQa1t3ugiAEhdhvw5FvDcYQF8hkf+S9JRACEIlFnj3VNJmxNFmVmloBvRI9XUUrMNNfO
         NmPNMA4MP0Rw/2YFqK6ctPM4s19cMSCQdeQgtQMihpOQsIDy96B/KeuwAEo1tirvPgTB
         pAev8SvLVNCUeU227JfrXqZ9bW0ISv9TY3tN8kx3JZMvbUwnG4hz8CC8GNCYSqsMUPVm
         4p4cqX3cEnv8LNJgZ6I2AGQm235EbNo/jgAtE2WSpViVqhBgk85pcb+xn31/dvq+fQgL
         1yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764234887; x=1764839687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X03jox/gV8bqLBLEBTR625O9w1oSc+eeKS2ioi2DhKA=;
        b=ks9h0Eqit094m2ShPB6y/v46aCOTbrfyr+1oxHReeheGCrhEKBckzDi5kmFtvbGQMu
         TzUaHDL99DvWnt4DgQXTPVcyzgfJiH7EHz58MiZIQvOGj5wAXJsoXvPcFNIBsWnNjjtW
         Z5O59jj611HXU5FtAaS9zlES2fMY8WlFXvKS+gdHxakaaIRvzP4bonFxowOU49Egev0F
         iCewgK8AWm7goTU3iqY4V58jRMNJtrLFul6l17cLe+VHwBaews/igXZ6Tj4ieXrqWWdX
         cIy/lN/grpUows8OdyXLg2bJc8wYQrzVnPy1tB6F+ckbb3I4fBLutyM1LMGy2bMfrrIF
         KK6A==
X-Forwarded-Encrypted: i=1; AJvYcCV0eJRufW67DT/lTDTacMrCAbCpf3kIrKkU3/ALtEFCaiaiFY3GDcoUTl791QMyObR4tRfhssbHWWfEwDI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycv4mDi4Ln8PVQ2OBqPfWuxL7NoOVlmSdaHN9r5rehKLQRsIM1
	+mqTusnfkukoM0kRHc7EFAKVRrIqjINoosRrE4LYWrwgnMOhvCOwbxfMqkuVNaInX0ZXrAlkFuT
	Xn6r43CNX2mNSIsTROu7Ft85Bn2Gq7TjUHx8eyvfVSw==
X-Gm-Gg: ASbGncuEvgxDbgynVDIOK/r8Kb9egF08g4DfLxbqHeuYMS1gMFcZEPwFYvjKwgXRnLa
	y0O2Z+0qXdQCSaEbDM93t7PuytfGCrXTF2TAPH0fjoKhdWb0pIUYDGJADb0GiKHwIAIhH6y1To9
	0WCZQjHvt+abUXgKuTcCza4wlLsdGTib4JGToORIWwWBsR1aXe8NFA+d9TvK5FMP42z2vT89y6m
	W+XixeB+aQyxSGnpmCBTR4a2FfnawrhEMZULvSe7vIWZ9qubKhrsMA7Sr2c7D2oI+q8haLTOhcv
	TumjT/XbIWOet3mB4Skoxq/z09Q=
X-Google-Smtp-Source: AGHT+IEbc2TbO/tYVAauVYSWlsGPpU9aKscxV4CCCOtz2gTp8D6aQtAJcJ71cXNyLsAVeBjOKBJwqCStf35Mbf46OXA=
X-Received: by 2002:a05:6512:8010:20b0:596:9ebf:25a2 with SMTP id
 2adb3069b0e04-5969ebf25d0mr6811454e87.19.1764234887164; Thu, 27 Nov 2025
 01:14:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-pci-m2-e-v2-0-32826de07cc5@oss.qualcomm.com> <20251125-pci-m2-e-v2-3-32826de07cc5@oss.qualcomm.com>
In-Reply-To: <20251125-pci-m2-e-v2-3-32826de07cc5@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 27 Nov 2025 10:14:35 +0100
X-Gm-Features: AWmQ_bkMx1pQI7KIzXZheaED5_3WOsSVYkYxsGF26N74WOl7tj2ktgI1roknym0
Message-ID: <CAMRc=Mc_=F3HiKCVh26RtJ-8vcFWbdRRFS5R8tJa7320W-Tcig@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] serdev: Allow passing the serdev device name to serdev_device_add()
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 3:45=E2=80=AFPM Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> Instead of always setting the serdev device name from 'struct device' nam=
e,
> allow the callers to pass an optional name and set it as the serdev devic=
e
> name.
>
> This will be used by the future callers passing the serdev device ID as t=
he
> name.
>
> Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---

Instead of modifying the existing callers with an unneeded argument,
I'd suggest adding a new call - serdev_device_add_full() or something
like that - that takes more arguments and make the existing function
wrap it.

Bart

