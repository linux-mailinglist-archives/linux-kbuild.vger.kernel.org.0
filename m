Return-Path: <linux-kbuild+bounces-12205-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGF5D2CDwWnTTgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12205-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 19:16:00 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D40DC2FB1A6
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 19:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 420FD31E8B05
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 16:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36803BED7A;
	Mon, 23 Mar 2026 16:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJtVj+ex"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9E53B2FC6;
	Mon, 23 Mar 2026 16:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284771; cv=none; b=dnLBBXgZgCATGWnhdhQTtDbKDMlglcLJtFBXQXD/fjLnqAK9Q9nRa9JwDPRbtAjCxxcBlOsxsPApAsduICEIXUUr9zWrl9p/YC3JT9XHjNA2cPZZKNci4lKkgRsHMmCXvxzz/iGyiB3Ifvjs5UIC9xpQyeqPy/VspvAQmU+oWpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284771; c=relaxed/simple;
	bh=Yuk6wk3lZC7gbzp4H6SpZqqgdfs+eRo7k0tXxPzD45k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aaGC7iZtIt8x6+lUsHPOmhgMa2TueyPhF7QAbMV2uwEGS6x7VCz6DWZwy9TvED1NLSEjiTAZ79pmEJ/LJrKvY4n0K09XG1JoHPUMR4OytgQBNhlBsikSNBzPQu6ChrF6SPg0/FYpd8J8FaTpoA9FHkPFJl+Iy+c1aPlCZ9eP2s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJtVj+ex; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE87C4CEF7;
	Mon, 23 Mar 2026 16:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774284771;
	bh=Yuk6wk3lZC7gbzp4H6SpZqqgdfs+eRo7k0tXxPzD45k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QJtVj+exPIBXiYtXCPaaLfcL7P97OgaSLNzI6lkB+NBESgVd7U+/6I7M0GqxSKchh
	 z7SX8PSb/fBTY5bISNd7HVk4DCVKIYrv5sTtQJUWirx4ymxSBb7okLUGuMwyo/oCjk
	 lQXlD6xmOsc4+IayQpxZjNvNIH6+sPKM/oU0n+ysK/z62IW2+5U3knnrF13M1FRJRd
	 rGSvfsQ/FxANOT2I/vedMjC6zCMRS6iJtdJroPeAatGs4rbp/cRc3hXMEZrqsdcCU+
	 HRBJrYec2VnfYFBuO1aIosea9vq/Dv+UnUtyZFp61SnVncNmBWSaBQGPZ3xwOv4pUs
	 VLpIY9BJfOOww==
Date: Mon, 23 Mar 2026 22:22:33 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v6 6/9] dt-bindings: connector: m2: Add M.2 1620 LGA
 soldered down connector
Message-ID: <m44mupdmg7kgco62n4evcviagqo7wwgyt3gybugbxwesd4ekjz@o24r6v4tpezc>
References: <20260317-pci-m2-e-v6-0-9c898f108d3d@oss.qualcomm.com>
 <20260317-pci-m2-e-v6-6-9c898f108d3d@oss.qualcomm.com>
 <20260322233713.GA98177-robh@kernel.org>
 <to2mrizprc3hjufqbiplpqyek7f4uutqtn4hx4gkmdgv2rykbc@ybwwjhdec4nm>
 <CAL_JsqJXrHCJt770bJkMmAUhirSF3kHjYwSzkG7cXp7-eys8Rg@mail.gmail.com>
 <6aef3xxjjd4nbgrfx6jc6jt6rpqmttoui6hil5zqgdpas2j6gj@ie6j72orenou>
 <fsvmmgoe5wslmxebhrrwmdg2ldcmhzvj53gjkdfnfg2m2rz2lw@dcfboaakz7ae>
 <bguhzabwryayyqkv4ilzwr3ixwv6bzxncblo3ircz2wm3fs52k@66zvcrfcb4oe>
 <blhm4csjyw6r667cleljgzd6rpwagttjo5rau7wjrlnjakq2qm@ekyhc4jvwmwf>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <blhm4csjyw6r667cleljgzd6rpwagttjo5rau7wjrlnjakq2qm@ekyhc4jvwmwf>
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
	TAGGED_FROM(0.00)[bounces-12205-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org,linaro.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D40DC2FB1A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 06:45:15PM +0200, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 09:26:04PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Mar 23, 2026 at 05:14:30PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Mar 23, 2026 at 07:14:25PM +0530, Manivannan Sadhasivam wrote:
> > > > On Mon, Mar 23, 2026 at 08:39:55AM -0500, Rob Herring wrote:
> > > > > On Mon, Mar 23, 2026 at 7:16 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > > > >
> > > > > > On Sun, Mar 22, 2026 at 06:37:13PM -0500, Rob Herring wrote:
> > > > > > > On Tue, Mar 17, 2026 at 09:59:56AM +0530, Manivannan Sadhasivam wrote:
> > > > > > > > Lenovo Thinkpad T14s is found to have a soldered down version of M.2 1620
> > > > > > > > LGA connector. Though, there is no 1620 LGA form factor defined in the M.2
> > > > > > > > spec, it looks very similar to the M.2 Key E connector. So add the
> > > > > > > > "pcie-m2-1620-lga-connector" compatible with "pcie-m2-e-connector" fallback
> > > > > > > > to reuse the Key E binding.
> > > > > > >
> > > > > > > What is LGA?
> > > > > > >
> > > > > >
> > > > > > Land Grid Array
> > > > > >
> > > > > > > If not in the spec, is it really something generic?
> > > > > > >
> > > > > >
> > > > > > Good question. Yes and No! LGA is not something that Lenovo only uses. Other
> > > > > > vendors may also use this form factor. PCIe connectors are full of innovation as
> > > > > > the spec gives room for hardware designers to be as innovative as possible to
> > > > > > save the BOM cost.
> > > > > 
> > > > > innovation == incompatible changes
> > > > > 
> > > > 
> > > > Yes, I was trying to sound nice :)
> > > > 
> > > > > > This is why I do not want to make it Lenovo specific. But if you prefer that, I
> > > > > > can name it as "lenovo,pcie-m2-1620-lga-connector".
> > > > > 
> > > > > Depends if you think that s/w needs to know the differences. Hard to
> > > > > say with a sample size of 1.
> > > > > 
> > > > 
> > > > Sure. Will add the 'lenovo' prefix then.
> > > 
> > > Is it really Lenovo? Or is it some other module vendor, whose LGAs are
> > > being used by Lenovo?
> > > 
> > > I remember that DB820c also used some kind of a module for the WiFi card
> > > (which might be M.2 compatible or might not, I can't find exact docs at
> > > this point).
> > > 
> > 
> > I don't know. These kind of designs might be reused by several vendors. But
> > considering that we should not make it generic, I'd go with Lenovo as that's
> > the only vendor we know as of now.
> 
> ... and later we learn that other vendors use the same idea /pinout,
> then nothing stops us from still telling that it's a
> "lenovo,pcie-m2-something-lga". 
> 

How do you possibly know whether a single vendor has introduced this form factor
or reused by multiple ones? Atleast, I don't have access to such a source to
confirm.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

