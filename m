Return-Path: <linux-kbuild+bounces-9663-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D27CC69898
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Nov 2025 14:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A5B64F54D6
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Nov 2025 13:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128202F5A3F;
	Tue, 18 Nov 2025 13:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eid/L6Fx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D0F2DA777
	for <linux-kbuild@vger.kernel.org>; Tue, 18 Nov 2025 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763471047; cv=none; b=WLJccOINdNsPoNjXTUPA3+wE9e1VmLUIIBxydvU0lOaGfxXZGYZ8h/FJLn6SGHLq3/7G4UW7fceo9BDjtdLh8H4dNacUwLStQQ1/fm9MTlZL17mnJq7aaZSgvjYyefenqK1OyQ50DqFBM1dM5rEMGK72eAggdUDTyxBwJ3EEBeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763471047; c=relaxed/simple;
	bh=QY1OIrfV7wJNhoLm6jftQrdDzbys+UOJ7sTIBabxKQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L3XxNeOrmU13ynD3zt5qC9ollrfgccxLxTx8JJik2A4wObltLEBdzWLLf/ZewNeDJELi4o+yOy0uljXoWtVzR/j78e6ysSFy99COcmRGoM+mFa+stLU9hkLfYhZzT7gdGUTggqK7SwOB8u+jbY+tCd2pl94Uhbnb42J+yIVPhdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eid/L6Fx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D8CC2BC86
	for <linux-kbuild@vger.kernel.org>; Tue, 18 Nov 2025 13:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763471046;
	bh=QY1OIrfV7wJNhoLm6jftQrdDzbys+UOJ7sTIBabxKQU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Eid/L6FxBAfeH5CqfmMyBOW63k1VrenwQw2zXA0r7ZPig0xuTdTXGzXWRrqEGuGm4
	 aZX23pOTW4/p+tSmTdrSo0JRAIMN8HhqJ9qwRKsRE3RGxmkLNrSNu0XTqIQfAwSzEu
	 lJq1Y+pjgdClixUMLaV9N+88rALAcKo4BQJO2LrdEV9pcSgOjeuaS9QtL2kNKQjU6w
	 AAcgrtvBtHcMZ+oy93JZy3RvzFId3zQuso5gnhhfACVX7LRWy53j7pNMWQDcYew/5X
	 iXPZI5JjSJ6KyIqfDwensoLJJZPLEmR3+rKyZ3RM+nyTZQydX4ZluwCfdz3JgUG4c6
	 NB8viXj9azbYw==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so7395648a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Nov 2025 05:04:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUZKFxUIbWmq/1mGdHdZCvdGdwzIsRxgj0UpOVKVTyJMsuxhX/9125dj23YMRqt0LUmvzzWFSsXaUWamcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxYEtyGnnH2KGKSv5FpEhc2u5cEOAtAc4DVNPHm9ibZDCDlSE+
	oUFxyyl/FsOPuxm3STrYZvI3U5M+Hh5x3MFMmJuP8FvBL2UZcCzub/DnZyxu76bipoxYKwuwz0y
	9+Vh2gNXBuQrV3x3svnA5Rf1mea8C/g==
X-Google-Smtp-Source: AGHT+IGzaPWs9CO2/QqJ2lcK3lJrPrwRYsH8Qm8HjBS/YlxbWZYRORJiSB2uoxSx80hvbGBnIei2bDGhcwM4UJKc8fE=
X-Received: by 2002:a05:6402:2809:b0:63c:2d72:56e3 with SMTP id
 4fb4d7f45d1cf-64350e8e003mr14781379a12.23.1763471043426; Tue, 18 Nov 2025
 05:04:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-pci-m2-e-v1-0-97413d6bf824@oss.qualcomm.com> <20251112-pci-m2-e-v1-6-97413d6bf824@oss.qualcomm.com>
In-Reply-To: <20251112-pci-m2-e-v1-6-97413d6bf824@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Nov 2025 07:03:51 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKBcXH0EWguto3EFY2cJ5p=8VUZczMHz1u5fNFocv-AmA@mail.gmail.com>
X-Gm-Features: AWmQ_blGP-_XDvdtj3MDVFdTuQEWnKJrtZXKQUPHlGxcSMsdX4Hk0jJFpfTnlMY
Message-ID: <CAL_JsqKBcXH0EWguto3EFY2cJ5p=8VUZczMHz1u5fNFocv-AmA@mail.gmail.com>
Subject: Re: [PATCH 6/9] serdev: Skip registering serdev devices from DT is
 external connector is used
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pm@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 8:45=E2=80=AFAM Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> If an external connector like M.2 is connected to the serdev controller
> in DT, then the serdev devices will be created dynamically by the connect=
or
> driver. So skip registering devices from DT node as there will be no
> statically defined devices.

You could still have statically defined devices. You are just choosing
to probe them later from the connector driver.

>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---
>  drivers/tty/serdev/core.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
> index 8c2a40a537d93f4b9353a2f128cdf51b521929b1..1378587d386356ca4415fa455=
b2ee722b5e44d3e 100644
> --- a/drivers/tty/serdev/core.c
> +++ b/drivers/tty/serdev/core.c
> @@ -12,6 +12,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/of_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> @@ -560,6 +561,15 @@ static int of_serdev_register_devices(struct serdev_=
controller *ctrl)
>         int err;
>         bool found =3D false;
>
> +       /*
> +        * When the serdev controller is connected to an external connect=
or like
> +        * M.2 in DT, then the serdev devices will be created dynamically=
 by the
> +        * connector driver. So skip looking for devices in DT node as th=
ere will
> +        * be no statically defined devices.
> +        */
> +       if (of_graph_is_present(ctrl->dev.of_node))
> +               return 0;

Where's the schema that allows graph nodes?

Rob

