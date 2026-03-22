Return-Path: <linux-kbuild+bounces-12137-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAc0D1d9wGm1IAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12137-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 00:37:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C8A2EB2C9
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 00:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7742301BF66
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 23:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7CA346E43;
	Sun, 22 Mar 2026 23:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+7WSNmZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9017C175A86;
	Sun, 22 Mar 2026 23:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774222634; cv=none; b=mUOayxGd1ZfBUVeEbG1smemsrP4ZxUuWqzIUjATYxYmVukwcIf7M6dqSNqOH4tPLnYya4w+qiiH5HWbM3t0PBbBcbFvmcPOC1SgBoWOEr4XJjeqxKzGBPpO0afuvePpU3nsAeRSjptqiXvYm4UOb1WPk4Fkp3IYtguyVDoSBMTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774222634; c=relaxed/simple;
	bh=C+cpYEwtbl8C0q9C0mMalH+TLGhOE8srxZhSJuIwx+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iaGyXhjXCr31IXVxEMo8f0u4qbwwuIAf23hP9TPvLT10MNX5r3Y/RBgJAvprp3/98dPFeLGPEDi3oi75/jbFbHrN7svRIlNkDovNnW1kMa9Q0+ZgbCuqbi9+9dmt6OoP3hQ3r6A8WGeL/XaXqN61HlZwJknAc5YO/UcBXN7lpGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+7WSNmZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31D6C19424;
	Sun, 22 Mar 2026 23:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774222634;
	bh=C+cpYEwtbl8C0q9C0mMalH+TLGhOE8srxZhSJuIwx+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d+7WSNmZj4S8oSiXYk5eP5KyTbdNiEYggcm6Uj+B/1sYgR/Ce4pTRNKUoSr1Gf26q
	 A5k+Ilqbqq7SdtpY1NBZzaCqeQZInLxHSsLlO3hj7yq8dEwlhGRo74lYFri8GjW/PT
	 rSD9CwyrDne9Wza2FNGZtS30s8K30TxX5FaiDedQeVP7C9sP4NfWf47cD849Xp+CvZ
	 6SXhpdtgnrmxguPMgp9+RUUJDWQyfeF4bYe7iFpkUuC/zauJtzFqqbRBXCEPPcX2Ay
	 I9Dj54Lg86HRUtj2hxAJajZR2EN/AacRIqEx7dnNHhO6miQ1JvJuyiBA3xdXxNgH0u
	 9R/zGQG+rUdIQ==
Date: Sun, 22 Mar 2026 18:37:13 -0500
From: Rob Herring <robh@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v6 6/9] dt-bindings: connector: m2: Add M.2 1620 LGA
 soldered down connector
Message-ID: <20260322233713.GA98177-robh@kernel.org>
References: <20260317-pci-m2-e-v6-0-9c898f108d3d@oss.qualcomm.com>
 <20260317-pci-m2-e-v6-6-9c898f108d3d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-pci-m2-e-v6-6-9c898f108d3d@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org,linaro.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-12137-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Queue-Id: 91C8A2EB2C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 09:59:56AM +0530, Manivannan Sadhasivam wrote:
> Lenovo Thinkpad T14s is found to have a soldered down version of M.2 1620
> LGA connector. Though, there is no 1620 LGA form factor defined in the M.2
> spec, it looks very similar to the M.2 Key E connector. So add the
> "pcie-m2-1620-lga-connector" compatible with "pcie-m2-e-connector" fallback
> to reuse the Key E binding.

What is LGA?

If not in the spec, is it really something generic?

> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/connector/pcie-m2-e-connector.yaml       | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
> index f7859aa9b634..d8cf9a9ec7d0 100644
> --- a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
> @@ -17,7 +17,14 @@ description:
>  
>  properties:
>    compatible:
> -    const: pcie-m2-e-connector
> +    oneOf:
> +      - items:
> +          - enum:
> +              - pcie-m2-1620-lga-connector
> +          - const: pcie-m2-e-connector
> +      - items:
> +          - enum:
> +              - pcie-m2-e-connector
>  
>    vpcie3v3-supply:
>      description: A phandle to the regulator for 3.3v supply.
> 
> -- 
> 2.51.0
> 

