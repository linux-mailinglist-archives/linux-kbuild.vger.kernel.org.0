Return-Path: <linux-kbuild+bounces-12155-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOUnJ5QwwWm7RQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12155-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 13:22:44 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1152F1D93
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 13:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0BD4303AB70
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 12:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E1139A805;
	Mon, 23 Mar 2026 12:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RcjLLSgh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F397C398919;
	Mon, 23 Mar 2026 12:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268216; cv=none; b=cuMcy5IxqMgb6OszvJn0jPbdQNBjt3i4vFEuT2bHhKzRjgBDiSk1VGZBGEn6/lA4u8e5xjSLsjKgartkUVY/lZu4zzB0fxYHlf4yKoI9agGpEZa9rIhSR1c81LBNAyw37t3vuMSeaHS0L3lc+gCLbuGiwvmd3myfmMIYZD/x3Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268216; c=relaxed/simple;
	bh=Ddisl8eA6K38RQGs2aAcAY683SyQnKLb6K5fJiuGCmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aT+FBnjqFuRBMTfU7eB+Awtxv9X65e4x89qRdXRcYSvhZGZCUjYT4kaCa9+6AmfL0hOYYHs3rFEW18D6cvvsz7GxNcy4Rw0PL/wdX5LgiG/IM1qvKlHWPHw4G3X15asq+5oJXIYvxZR0+BCdIwy0Opn2YkuVIiE+yrWTLcpxFUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RcjLLSgh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23AFEC2BC9E;
	Mon, 23 Mar 2026 12:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774268215;
	bh=Ddisl8eA6K38RQGs2aAcAY683SyQnKLb6K5fJiuGCmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RcjLLSghn833nF0KLQr3XjLnS0REP7tklA1Qcs93KHDQwWYbVzTMAkfCAbKbUTPw1
	 Xuwaj/pBAPWGuPnGMERvoBx3+2DuRSOzzuoEe5vN7cK/WTxrvA/DOFi/aP3xYQUmHd
	 nukcEF5WqR2HNjei6dITzJWSXpgdc52sbqkjhllAml5pkpGtY6TAo/Fg7AosfAXzLj
	 u/fFy2ag8KPiP56f/BqNKA0EpoRf9HtweCuGRvdqC2a5wYHSuZ+nB4Uvg0dFcFXNgB
	 R0qNLfuU/HdGtfEf9arr5sDKurwt86OuCpRTn6gNuPjdCN9HoCKcrf6Q18Ut7QlzPw
	 C2YXYFxWUW0ZQ==
Date: Mon, 23 Mar 2026 17:46:38 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pm@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v6 6/9] dt-bindings: connector: m2: Add M.2 1620 LGA
 soldered down connector
Message-ID: <to2mrizprc3hjufqbiplpqyek7f4uutqtn4hx4gkmdgv2rykbc@ybwwjhdec4nm>
References: <20260317-pci-m2-e-v6-0-9c898f108d3d@oss.qualcomm.com>
 <20260317-pci-m2-e-v6-6-9c898f108d3d@oss.qualcomm.com>
 <20260322233713.GA98177-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260322233713.GA98177-robh@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12155-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linuxfoundation.org,kernel.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org,linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 3B1152F1D93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 06:37:13PM -0500, Rob Herring wrote:
> On Tue, Mar 17, 2026 at 09:59:56AM +0530, Manivannan Sadhasivam wrote:
> > Lenovo Thinkpad T14s is found to have a soldered down version of M.2 1620
> > LGA connector. Though, there is no 1620 LGA form factor defined in the M.2
> > spec, it looks very similar to the M.2 Key E connector. So add the
> > "pcie-m2-1620-lga-connector" compatible with "pcie-m2-e-connector" fallback
> > to reuse the Key E binding.
> 
> What is LGA?
> 

Land Grid Array

> If not in the spec, is it really something generic?
> 

Good question. Yes and No! LGA is not something that Lenovo only uses. Other
vendors may also use this form factor. PCIe connectors are full of innovation as
the spec gives room for hardware designers to be as innovative as possible to
save the BOM cost.

This is why I do not want to make it Lenovo specific. But if you prefer that, I
can name it as "lenovo,pcie-m2-1620-lga-connector".

- Mani

> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/connector/pcie-m2-e-connector.yaml       | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
> > index f7859aa9b634..d8cf9a9ec7d0 100644
> > --- a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
> > +++ b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
> > @@ -17,7 +17,14 @@ description:
> >  
> >  properties:
> >    compatible:
> > -    const: pcie-m2-e-connector
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - pcie-m2-1620-lga-connector
> > +          - const: pcie-m2-e-connector
> > +      - items:
> > +          - enum:
> > +              - pcie-m2-e-connector
> >  
> >    vpcie3v3-supply:
> >      description: A phandle to the regulator for 3.3v supply.
> > 
> > -- 
> > 2.51.0
> > 

-- 
மணிவண்ணன் சதாசிவம்

