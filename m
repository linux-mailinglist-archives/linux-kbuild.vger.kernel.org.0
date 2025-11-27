Return-Path: <linux-kbuild+bounces-9884-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DE3C8EA07
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Nov 2025 14:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAA163B858A
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Nov 2025 13:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD3129346F;
	Thu, 27 Nov 2025 13:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uLj1JFNa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3452029B8D0
	for <linux-kbuild@vger.kernel.org>; Thu, 27 Nov 2025 13:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764251364; cv=none; b=FV6KiQapMzs8sY0v4KZgrZ/brgQ+i55gJqWWZyhnpmSVEKZmoJaR1W6XplwidjNDKFctQhGpy4X+8Gx7xnaaHX0HbBW4Y1vcc3G051SDKyhZ5M9DtJVqEbwVYoSInWOvWEESccNQ/SuBBuxcfF4+8dfEK3BQA9vdIPCURf6O86c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764251364; c=relaxed/simple;
	bh=djx46A/t4g9tFTNKTkwprP+1rBHg+hljQCYzR5C8ROA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZrVUNaTNHGv8CJDu8nLNp6PH7AH6EQmnIUHZ6q2v0aplE6NlWD4vwrTOpO1mqOBLOgfzKI1DHqOOEPQdviPyDGJtWYPRI3ZWG5lo5bIlSWtS/Btg6w9TjDTa6yYxrO76G02bXb7nnnTsxLSmBjWLTxMRxDewjj2y/Llu9SM+7Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uLj1JFNa; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5957753e0efso980338e87.1
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Nov 2025 05:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764251360; x=1764856160; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=djx46A/t4g9tFTNKTkwprP+1rBHg+hljQCYzR5C8ROA=;
        b=uLj1JFNaKbDfbxo09KGuxHCMyfKejpCJ1WTapAbhCouqWGf7nWZMdnozs59WqDSOOe
         pKh+xItKdnpSkz+ie4zbDtWnGqjhIUj5iJcN4GZc3r9OWWFjUDbtmIDFnDxS7kQs52N5
         o7zRwL9XMpj0ovWUukkXhdxO+Oom/eQ0xP1Bqhns1G3+RLZvbuTMbuE9wi0OoxAuFS/a
         PPG6CyfX81DIu4rzuUmZ0n2d7PklxBj89vNtazQQpqPzyAkP9MVXbw8pmaXbiQRlQAok
         Je2FL5kvoXJ0r70ZgvakShfVpiV4HBUa4RGJc9S0isAgm4GJ9jVZ2ODpt7XqWEIKhhNw
         jhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764251360; x=1764856160;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djx46A/t4g9tFTNKTkwprP+1rBHg+hljQCYzR5C8ROA=;
        b=dYCkEO+3Vor98pE4xlg61QNUHLlkVq3U+GmE1w36X3aMQTpnOMib/jfv2PumjYzjmm
         Y8bKksv+LPtFvzJZ2UPIruv73FWxH9ru039TJNRoIWar3sYepESeCwvvfhn6BIP/pRCE
         Ti35E5jv4jqIYD6mYX2vxDJYyjbpPrAI5D9ZiFxQKAuY9gCn/wv1e3uuQxuCP1N2E91H
         ZRYH2WFEdIwsmS3p3hgp390fDqlU9JE2mCdysWqufwDs1iELzYLBRW5Ik5tcf8tIKTht
         Yu2NodWbPOg+FWYg/RzSWJQf8/WbDqtkfoG3hONeEgpnIUyrefTnSidNrXTNMMnaxBbn
         RDAA==
X-Forwarded-Encrypted: i=1; AJvYcCW/gywp9uXOOj9F6wmaBS7oBF2mU517wFjz8UGqoZapJbaqJy78zvHwu0PvnKAnIzZRzBxebZ+7nmYig/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTxkastBrGu5k2ljWfsihA2nCpovYETP9QvCpJm2au+0Bs/DLd
	S9eDOL4JVKTLMmSefWudNTna2j9n3PUAbVOSW/CFKP1Dk+jAYinVT0ay6HU8gNm8NY0U0Wauejd
	3PGMG+TTrvcrDrr9WLuh837qva5hOwi1M77CRK2bNzg==
X-Gm-Gg: ASbGnctlpuQWRBwQ8cKbXFbmcBb1Cjc6v0PTcuYy6X1LCUR+ze7LeFT/Hn7IE9ywDJO
	ykZaDlTyZ/xJBv/PihLJy5M7LQKfwIIR1xCny3evgu5AK/+pYy7VF7PKed+F6y6MeoKL1f8spEu
	yf+zkD+c3Ro1hBtMLG7hPiYnxxvcJyRfCK0eM7zxjGWe+mg1vWW6odFiATnGMch1dgvjLgKriTa
	2i35ttNeM61DY0jCB8GPEAmeAzFoI6xQ20xdm4d8xfTauXUX+rG70AGigWZjdYS4C4DI8CAJ2pr
	Ff/9RBeYfpZWOOaX0MihN6e8u4I=
X-Google-Smtp-Source: AGHT+IH+CDUfKujPpotwtmLcmyLVWHWVuqtFgSXM/kqLIDQE6VNVNZAmDKJw5gKN9s8jiNvQgCQtNi8buZoDHFa0ulg=
X-Received: by 2002:a05:6512:800c:20b0:596:a540:c95f with SMTP id
 2adb3069b0e04-596a540cb59mr5729287e87.19.1764251360301; Thu, 27 Nov 2025
 05:49:20 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Nov 2025 05:49:19 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Nov 2025 05:49:19 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20251125-pci-m2-e-v2-9-32826de07cc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-pci-m2-e-v2-0-32826de07cc5@oss.qualcomm.com> <20251125-pci-m2-e-v2-9-32826de07cc5@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 05:49:19 -0800
X-Gm-Features: AWmQ_bmLrPADj6DoaQnC1ZJGmDNpk5NRcjPDulR-pWqLbapX0f-JV3TGd0Beet4
Message-ID: <CAMRc=McQO4OKra4S+goHsrq75HJbO1U=pfOg_8RrGFxNwy_-pw@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] Bluetooth: hci_qca: Add support for WCN7850 PCIe
 M.2 card
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pm@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 15:45:13 +0100, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> The WCN7850 PCIe M.2 card connected to the UART controller exposes the
> 'WCN7850' serdev device and is controlled using the pwrseq framework.
>
> Hence, add support for it in the driver. It reuses the existing
> 'qca_soc_data_wcn7850' driver data.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

