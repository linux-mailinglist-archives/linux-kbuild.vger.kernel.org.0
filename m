Return-Path: <linux-kbuild+bounces-12794-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL0aEeGn32nQXQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12794-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 16:59:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 888884059B7
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 16:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A81C306CD11
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 14:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA41F3D75C3;
	Wed, 15 Apr 2026 14:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="odMVGQ2n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D512D0603;
	Wed, 15 Apr 2026 14:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776265029; cv=none; b=nQ5jDbiiWlwgnap6aLET57e6sDd6rGRkd8dQtIgg6CT4JQ27CgwAuqEev5HXh8jGL52al2ICrq1rxrLRHtBgkTjnxJP6thJ5zP7MOEyjL9tvDitNhWa7XnYrH39tPOvazRxOT+iDg3wucdGlX9/NNgYLL8pdhWr557s8gEphx6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776265029; c=relaxed/simple;
	bh=1S2kdSoru/ifNvwgwwUu/EShTTtvBQkznTzuC20u86I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dKd6O9rUDcbdDc4wOwby9ZSxZ/4rBKBKFVqVwXF7FQ49NrLQK0wCZpn7Eeiqom/LVRJlYC5wuPfS4hAxA4VjfWHCh74fPnqB6k7OvoAarGOu4K0NlaE/j805XEbBzKQP+8U6LIeePkEDNjVjxZ6f2kzodDyZNh7lK/jO6Oo36W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=odMVGQ2n; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BF20B1A32D8;
	Wed, 15 Apr 2026 14:57:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D7B360420;
	Wed, 15 Apr 2026 14:57:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A90DA10459FC4;
	Wed, 15 Apr 2026 16:56:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776265023; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wNrWnquhsR0dlE0WJjRS5Whb5Pw+B2YUuFT6hABZVPw=;
	b=odMVGQ2nxDTLW1G3zgpTCupAd+WE2qFmsXEHoMqdccBJm6+seTVkYni4wkvFut2s/DTE9G
	rQgJl0iu49WoTtlt1D/ZKPek9XtvZcEmNB9JnLU3j86MKSmxk0y1H4eOFoLP4pJQsWK0+w
	LDUa2pRoeccJ5yO0iFUiIEbEnbUiIajUOclrFN+JeJ62x/Xy4nqUEFN9xkXGH+zLdqVXtx
	kehs4bdgRvsag91OXjg4XIBY8DTEtrZvQr4puEi8w9yA6S832dhmPp7KfxTskDf4t6OHwQ
	pnPSy6MjhtDRs2iRsgVjZI0ToOQtgYM1i8qxDLRKg3x0iefOJqJW241JPYnlmg==
Date: Wed, 15 Apr 2026 16:56:51 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Manivannan
 Sadhasivam <mani@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas.schier@linux.dev>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto
 von Dentz <luiz.dentz@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org, Stephan Gerhold
 <stephan.gerhold@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, linux-acpi@vger.kernel.org, Hans de
 Goede <johannes.goede@oss.qualcomm.com>, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 0/8] Add support for handling PCIe M.2 Key E
 connectors in devicetree
Message-ID: <20260415165651.153b573d@bootlin.com>
In-Reply-To: <CAGXv+5EPA29G-fsH=wWOD8AK6TZFezFhsE0NHPYj_Pt3nT+d_w@mail.gmail.com>
References: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
	<20260413075459.GA2626902@google.com>
	<fpcs4p62f35a5qyqwgm5ysa73stbysxcr62tkmmkrrcvsuf4t4@4ivukyqjey57>
	<eeytuhqpgdz4do4tgtbmfntub2femtyq7bij7svhodpyjwaylx@j3gmvq2a2zqc>
	<CAGXv+5E=tujhtZjwi6Qm7hk3Ks74UzTQHWq82NiTEw1+vYod5g@mail.gmail.com>
	<ad36pIu-0dutL7Nk@ashevche-desk.local>
	<CAGXv+5EGe59nJctLweEdZjb3MNmMvjuCHngGSfptzN985OiLdg@mail.gmail.com>
	<ad4tJN27opdEooA7@ashevche-desk.local>
	<CAGXv+5EPA29G-fsH=wWOD8AK6TZFezFhsE0NHPYj_Pt3nT+d_w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,oss.qualcomm.com,linuxfoundation.org,linux.dev,squebb.ca,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org,linaro.org,bootlin.com];
	TAGGED_FROM(0.00)[bounces-12794-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:mid,bootlin.com:dkim,bootlin.com:url]
X-Rspamd-Queue-Id: 888884059B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Chen, all,

...
 
> 
> I'm not arguing for a even more generic "M.2" connector. The "key" is
> already described in the compatible. I'm saying we should have some way
> of describing the individual interfaces (PCIe, SDIO, USB, UART, I2S, I2C)
> on the connector so further nodes or properties can be attached to them,
> either with overlays or dynamically within the kernel. Right now the
> are only described as individual ports, but we can't actually tie a
> device to a OF graph port.
> 
> But maybe I'm overthinking the representation part. AFAICT for Qualcomm's
> UART-based BT bit part, Mani just had the driver create a device node
> under the UART (by traversing the OF graph to find the UART). If that's
> the desired way then the connector binding should mention it. And that
> works for me. But I think it's messier and also we're missing an
> opportunity to make the M.2 connector a standardized attachment point
> for overlays.
> 
> Mani, could you also chime in a bit on what you envisioned?
> 
> (Added Luca from Bootlin to CC, as I think there are parallels to the
>  "Hotplug of Non-discoverable Hardware" work)
>

Related to "Hotplug of Non-discoverable Hardware",

I would add entries for busses in the connector without using an OF graph.

For I2C and later SPI, this was is done.

You already have an i2c-parent property but no node where an i2c device
can be added.

The last discussion related to hotplug, connectors and DT led to the RFC
series [1].

It is a huge series. The last patch give a real example of representation:
  https://lore.kernel.org/all/20260112142009.1006236-78-herve.codina@bootlin.com/

In your case I would see some thing like:

    connector {
        compatible = "pcie-m2-e-connector";
        vpcie3v3-supply = <&vreg_wcn_3p3>;
        vpcie1v8-supply = <&vreg_l15b_1p8>;

	/*
	 * If those GPIOs have to be used by components available in
	 * the connected board, a Nexus node should be used.
         */
        w-disable1-gpios = <&tlmm 115 GPIO_ACTIVE_LOW>;
        w-disable2-gpios = <&tlmm 116 GPIO_ACTIVE_LOW>;
        viocfg-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
        uart-wake-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
        sdio-wake-gpios = <&tlmm 119 GPIO_ACTIVE_LOW>;
        sdio-reset-gpios = <&tlmm 120 GPIO_ACTIVE_LOW>;

	conn-i2c {
		i2c-parent = <&i2c0>;

		/*
 		 * Here i2c devices available on the board
		 * connected to the connector can be described.
		 */
	};

	/* Same kind to description for other busses */
	conn-pcie {
		pci-parent = <&xxxxx>;

		/*
		 * The PCIe bus has abilities to discover devices.
		 * Not sure this node is needed.
		 *
		 * If a PCI device need a DT description to describe
		 * stuffs behind the device, what has been done for LAN966x
		 * could be re-used [2] and [3]
		 */
	};

	conn_uart {
		uart-parent = <&uart-ctrl>;

		/* uart child (maybe a serdes) should be describe here
	};

	...
    };

Of course, some DT symbols need to be exported in order to have them usable from
the DT describing the connected board.

This notion of exported symbol is not yet available upstream and is the purpose of
the RFC series [1].

[1] https://lore.kernel.org/all/20260112142009.1006236-1-herve.codina@bootlin.com/
[2] https://elixir.bootlin.com/linux/v7.0/source/drivers/misc/lan966x_pci.c
[3] https://elixir.bootlin.com/linux/v7.0/source/drivers/misc/lan966x_pci.dtso

Feel free to ask for more specific question if needed.

Best regards,
Hervé

> 
> Thanks
> ChenYu
> 
> 
> > > The latter part is solvable, but we likely need child nodes under the
> > > connector for the different interfaces. Properties that make sense for
> > > one type might not make sense for another.
> > >
> > > P.S. We could also just add child device nodes under the controller to
> > > put the generic properties, but that's splitting the description into
> > > multiple parts. Let's not go there if at all possible.  
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >  



-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

