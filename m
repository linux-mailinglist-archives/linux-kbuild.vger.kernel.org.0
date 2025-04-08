Return-Path: <linux-kbuild+bounces-6515-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 919D9A7FC3A
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 12:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0CAB421890
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 10:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D8D26A0BF;
	Tue,  8 Apr 2025 10:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="C1BR6YR+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093F426A0A8
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Apr 2025 10:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744108084; cv=none; b=GF+qb+fQFdKxZ+Y2VEynCRCFfXoiu6AHKNaVaiMlF43cSrV9L/55SZvfzkW2l66UHpOdhoB8bg1fUcPbjl4EOBnAai0BV6aUzFtst4CqZC/Ot9irF16q1X2y4WhdW/3wUj41gqOhAkNaKR0tJGTLJDyzEijqvE+D4Yw3gZAiyyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744108084; c=relaxed/simple;
	bh=WrI0lX7+J5s+4CwxTeHTL2V9dJJ7Iqdsj3G+bwSv8Qg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=C4YqBUTz56OYyW+i2iJyzq8aRBoqgsHKaFg837kkqLBq0TZ5jMekNRLlrrcgDF8zzv64YMkLKnKAWFuHhaHOGtHoF3lPFWOIrXItexCfci5bSnNxVdTJbvx385bTXjPE087or/1/QTupmjvMoEZd4DEkvXkIG+PtOhlG44aIk4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=C1BR6YR+; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so866965466b.1
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Apr 2025 03:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744108080; x=1744712880; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pv5rrjrhBcfKnYh0Q7OEJ/yH0eQFOKYhTNlnDBdY1gs=;
        b=C1BR6YR+nGpAodc2Emag1kg/19o1IQUzGynXJh+FLgOOva8XwJVMOwSaI6FqEvr9gW
         rfigQNGiU73BOQFNwdI8Z75ud0A2FSqcDi9x+S8hgwrgEJyiagxXgpRz05KyJHBeyXYE
         LAQ+WDoZBJa052TPGot/7bruib3RqLQMMecrYBCeJCLTdAigo3ab15y0XlR3VimY6kyT
         6crfKu/MLqFeFaCMRKU/9GUml5olMXEemHGnCYexkvZhC4dAIfAHdRKo8oXX0vmdsYzs
         xY5kp8bkF4TaTShQHazuuAzHW5ARM59OAlwG7R4wrpi0acSUeq5e++43DEO8evY2+Sbf
         pM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744108080; x=1744712880;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pv5rrjrhBcfKnYh0Q7OEJ/yH0eQFOKYhTNlnDBdY1gs=;
        b=CmT7T4nC8y3xY8EhyRJ19sYM6PVOtaRH76VSCm+ptFuQXByBmn/7vToaxckLZNxl6B
         IcgRsbkKNtSkuxkNvXrWLtQncAj5MPNAyIx5B4z8eNAjE3qg79UHZAVrapvA5Txres0Z
         s8Vx+qy6hI3rkVgcYsPWuEUbmd52RnnUg/Wdnz7FRHBtTgewzuSF/rLGnZDnhCGsVbk/
         sjm/4Xu8o45zAGjwXIBhIB0ocNPyK516ef0zDEx3me5YpGzDMXJBIRPik6fX9NmLKN2u
         kP2dWe7K5tHrjzeet9kPNv+DhVygwBQ97NGdaQ97tcQpS9CcBIgCHJBBpGDPTWLGUF4S
         AS2A==
X-Forwarded-Encrypted: i=1; AJvYcCVOK608MoZRRcrihkprfl7zgdRPiMyleIsK+jgBVPsvzU+aBVCnx/f6PUAmf8OApgStqH3V7ctqPbFjIVY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym4JvEjdwRlLbtCtsDc6HrRNbZfFw6qzIPcU4j8UaSoPzBsdoa
	4SvQVgVQKWgMfCwLRtUTVd5smvvX0JJLfm3SZn0DWIv7IjvcWWH+0caB1OuC9as=
X-Gm-Gg: ASbGncsgRA3eQ97NboNsh972CT1VR/PbXjKdCShnVJl+rJ8ft9NN9puvucUX9d3UF8P
	uCJ9crw/Get5fPLoDetsIQMCu6UdS3sNiEF3aO5V6E0ADseHf9HvFhb8xbfIThmNfSq4+Fb1ddt
	MEhWvrSLuhJBOe6ubtWW/A1oJTJkN5Fgq99LXfuB5p4wYyE2WZe5VRiXSWLCwTBuXdrXNjGXjQH
	9VIqJHSGwl2n0mkEcdClfBEJWUy/yiHvnfJnG3T7FAjtPQxepdm0ehaDzonHlr7QaajqVSaezi8
	IZfDN12WpoQfs13yMiDM+cJY1xrXl09sXJlxIZlNCgS0uhhRzClrdEJFLD9r+SPV8WqW6Zskobu
	jM4ZnLNs6gH08yA==
X-Google-Smtp-Source: AGHT+IESBdUuaEBUx9lGQ+c+tpA4+Swqaw0w+9TY0oUjOWcmr9SgDm/idOrRiIt3O3EZmRZOQ/hskA==
X-Received: by 2002:a17:906:2b05:b0:ac8:1798:a796 with SMTP id a640c23a62f3a-ac81798a8fdmr245365866b.54.1744108080129;
        Tue, 08 Apr 2025 03:28:00 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe67e17sm896532566b.34.2025.04.08.03.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 03:27:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Apr 2025 12:27:58 +0200
Message-Id: <D916PQ9VLGEB.Q61B70OVQ9JZ@fairphone.com>
Cc: "Yassine Oudjana" <yassine.oudjana@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 0/3] QRTR bus and Qualcomm Sensor Manager IIO drivers
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Yassine Oudjana" <y.oudjana@protonmail.com>, "Jonathan Cameron"
 <jic23@kernel.org>, "Lars-Peter Clausen" <lars@metafoo.de>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Manivannan Sadhasivam"
 <manivannan.sadhasivam@linaro.org>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier"
 <nicolas.schier@linux.dev>, "Alexander Sverdlin"
 <alexander.sverdlin@gmail.com>, "Sean Nyekjaer" <sean@geanix.com>, "Javier
 Carrasco" <javier.carrasco.cruz@gmail.com>, "Matti Vaittinen"
 <mazziesaccount@gmail.com>, "Antoniu Miclaus" <antoniu.miclaus@analog.com>,
 "Ramona Gradinariu" <ramona.gradinariu@analog.com>, "Yo-Jung (Leo) Lin"
 <0xff07@gmail.com>, "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>, "Danila Tikhonov" <danila@jiaxyga.com>,
 "Antoni Pokusinski" <apokusinski01@gmail.com>, "Vasileios Amoiridis"
 <vassilisamir@gmail.com>, "Petar Stoykov" <pd.pstoykov@gmail.com>,
 "shuaijie wang" <wangshuaijie@awinic.com>, "Yasin Lee"
 <yasin.lee.x@gmail.com>, "Borislav Petkov (AMD)" <bp@alien8.de>, "Dave
 Hansen" <dave.hansen@linux.intel.com>, "Tony Luck" <tony.luck@intel.com>,
 "Pawan Gupta" <pawan.kumar.gupta@linux.intel.com>, "Ingo Molnar"
 <mingo@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250406140706.812425-1-y.oudjana@protonmail.com>
In-Reply-To: <20250406140706.812425-1-y.oudjana@protonmail.com>

Hi Yassine,

On Sun Apr 6, 2025 at 4:07 PM CEST, Yassine Oudjana wrote:
> Sensor Manager is a QMI service available on several Qualcomm SoCs which
> exposes available sensors and allows for getting data from them. This
> service is provided by either:
>
> - SSC (Snapdragon Sensor Core): Also known as SLPI (Sensor Low Power
>   Island). Has its own set of pins and peripherals to which sensors are
>   connected. These peripherals are generally inaccessible from the AP,
>   meaning sensors need to be operated exclusively through SSC. The only
>   known SoCs in this category are MSM8996 and MSM8998 (and their
>   derivatives).
> - ADSP (Audio DSP): Shares pins and peripherals with the AP. At least on
>   some devices, these pins could be configured as GPIOs which allows the =
AP
>   to access sensors by bit-banging their interfaces. Some SoCs in this
>   category are SDM630/660, MSM8953, MSM8974 and MSM8226.
>
> Before Sensor Manager becomes accessible, another service known as Sensor
> Registry needs to be provided by the AP. The remote processor that provid=
es
> Sensor Manager will then request data from it, and once that process is
> done, will expose several services including Sensor Manager.
>
> This series adds kernel drivers for the Sensor Manager service, exposing
> sensors accessible through it as IIO devices. To facilitate probing of th=
e
> Sensor Manager core driver, QRTR is turned into a bus, with services bein=
g
> exposed as devices. Once the Sensor Manager service becomes available, th=
e
> kernel attaches its device to the driver added in this series. This allow=
s
> for dynamic probing of Sensor Manager without the need for static DT
> bindings, which would also not be ideal because they would be describing
> software rather than hardware. Sensor Manager is given as a working examp=
le
> of the QRTR bus. Kernel drivers for other services may also be able
> to benefit from this change.
>
> As previously mentioned, a Sensor Registry server must run on the AP to
> provide the remote processor (either SLPI or ADSP) with necessary data.
> A userspace implementation of this server is made[1]. The server can be
> supplied with the necessary data in the form of a plain-text configuratio=
n
> file that can be pulled from the Android vendor partition (sample[2]), or
> generated from a binary file that can be pulled from the persist partitio=
n.
> A more recently developed kernel implementation of the Sensor Registry
> server[3] can also be used. This last implementation only supports readin=
g
> data from the binary file pulled from persist. Sensor Registry remains ou=
t
> of the scope of this patch series, as the Sensor Registry server and Sens=
or
> Manager client (this series) are fully independent components.
>
> Due to the total lack of documentation on Sensor Manager, this driver was
> almost entirely the result of a process of capturing transactions between
> SSC and the proprietary Android daemons with several methods and manually
> decoding and interpreting them, sometimes by comparing with values acquir=
ed
> from Android APIs. A blog post[4] describes part of this process more
> detail. A little piece of downstream Android open-source code[5] was also
> used as reference during later stages of development. All of this, as wel=
l
> as a lack of time on my side for the last couple of years, meant that thi=
s
> driver had to go through a slow and intermittent development process for
> more than 3 years before reaching its current state.
>
> Currently supported sensor types include accelerometers, gyroscopes,
> magentometers, proximity and pressure sensors. Other types (namely
> light and temperature sensors) are close to being implemented.
>
> Some testing instructions may also be found here[6].

It's awesome to see this work being sent! I remember trying this quite a
while ago, so I definitely need to pick this up again and try it out!

I can try on msm8226, msm8974 and msm8953 so lots of platforms which
will gain sensor support thanks to you!

Regards
Luca

>
> [1] https://gitlab.com/msm8996-mainline/sns-reg
> [2] https://github.com/nian0114/android_vendor_xiaomi_scorpio/blob/mkn-mr=
1/proprietary/etc/sensors/sensor_def_qcomdev.conf
> [3] https://github.com/sdm660-mainline/linux/pull/57
> [4] https://emainline.gitlab.io/2022/04/08/Unlocking_SSC_P2.html
> [5] https://android.googlesource.com/platform/system/chre/+/android-8.0.0=
_r2/platform/slpi
> [6] https://gitlab.postmarketos.org/postmarketOS/pmaports/-/merge_request=
s/4118
>
> Yassine Oudjana (3):
>   net: qrtr: Turn QRTR into a bus
>   net: qrtr: Define macro to convert QMI version and instance to QRTR
>     instance
>   iio: Add Qualcomm Sensor Manager drivers
>
>  MAINTAINERS                                 |  18 +
>  drivers/iio/accel/Kconfig                   |  10 +
>  drivers/iio/accel/Makefile                  |   2 +
>  drivers/iio/accel/qcom_smgr_accel.c         | 138 ++++
>  drivers/iio/common/Kconfig                  |   1 +
>  drivers/iio/common/Makefile                 |   1 +
>  drivers/iio/common/qcom_smgr/Kconfig        |  16 +
>  drivers/iio/common/qcom_smgr/Makefile       |   8 +
>  drivers/iio/common/qcom_smgr/qcom_smgr.c    | 589 ++++++++++++++++
>  drivers/iio/common/qcom_smgr/qmi/Makefile   |   3 +
>  drivers/iio/common/qcom_smgr/qmi/sns_smgr.c | 711 ++++++++++++++++++++
>  drivers/iio/common/qcom_smgr/qmi/sns_smgr.h | 163 +++++
>  drivers/iio/gyro/Kconfig                    |  10 +
>  drivers/iio/gyro/Makefile                   |   2 +
>  drivers/iio/gyro/qcom_smgr_gyro.c           | 138 ++++
>  drivers/iio/magnetometer/Kconfig            |   9 +
>  drivers/iio/magnetometer/Makefile           |   2 +
>  drivers/iio/magnetometer/qcom_smgr_mag.c    | 138 ++++
>  drivers/iio/pressure/Kconfig                |  10 +
>  drivers/iio/pressure/Makefile               |   1 +
>  drivers/iio/pressure/qcom_smgr_pressure.c   | 106 +++
>  drivers/iio/proximity/Kconfig               |  10 +
>  drivers/iio/proximity/Makefile              |   1 +
>  drivers/iio/proximity/qcom_smgr_prox.c      | 106 +++
>  drivers/soc/qcom/qmi_interface.c            |   5 +-
>  include/linux/iio/common/qcom_smgr.h        |  64 ++
>  include/linux/mod_devicetable.h             |   9 +
>  include/linux/soc/qcom/qrtr.h               |  36 +
>  net/qrtr/af_qrtr.c                          |  23 +-
>  net/qrtr/qrtr.h                             |   3 +
>  net/qrtr/smd.c                              | 250 ++++++-
>  scripts/mod/devicetable-offsets.c           |   4 +
>  scripts/mod/file2alias.c                    |  10 +
>  33 files changed, 2573 insertions(+), 24 deletions(-)
>  create mode 100644 drivers/iio/accel/qcom_smgr_accel.c
>  create mode 100644 drivers/iio/common/qcom_smgr/Kconfig
>  create mode 100644 drivers/iio/common/qcom_smgr/Makefile
>  create mode 100644 drivers/iio/common/qcom_smgr/qcom_smgr.c
>  create mode 100644 drivers/iio/common/qcom_smgr/qmi/Makefile
>  create mode 100644 drivers/iio/common/qcom_smgr/qmi/sns_smgr.c
>  create mode 100644 drivers/iio/common/qcom_smgr/qmi/sns_smgr.h
>  create mode 100644 drivers/iio/gyro/qcom_smgr_gyro.c
>  create mode 100644 drivers/iio/magnetometer/qcom_smgr_mag.c
>  create mode 100644 drivers/iio/pressure/qcom_smgr_pressure.c
>  create mode 100644 drivers/iio/proximity/qcom_smgr_prox.c
>  create mode 100644 include/linux/iio/common/qcom_smgr.h
>  create mode 100644 include/linux/soc/qcom/qrtr.h


