Return-Path: <linux-kbuild+bounces-12200-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDnaAtJqwWkVTAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12200-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 17:31:14 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E502F83A2
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 17:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 933753020648
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 15:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965853B27C8;
	Mon, 23 Mar 2026 15:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QIXp3d40"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF5138910A;
	Mon, 23 Mar 2026 15:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774281382; cv=none; b=TykArigwVewU0KqFGlGeWgb0/Chmtvk8tgb6fM7TGLeaLZVBqlTAQPSgsOwDbfC4zN3J9/fAPgyFx/uKzVSiPd70vi3HWiQ3mvPyCXkYThSH3edSex7GCkd7s6C1ewYGLj1n2oY3ljTvx8L1zkGGdF+F/BMai0OM8sinQ3+OeZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774281382; c=relaxed/simple;
	bh=2cxH4u9j7HBt4tepb+AzkkHYs+Gdvh85t88nic+Sm+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iG0/hI46NjOqCoG9BKHI6yDiFodA1UBQAJAk8Aw4WsofYHwfGcAIl7XuvHNE/feLLFfqj7BdvuXqpC5UjqTRaGjGb2K/nowf0UXse3+Ex7IykuK4+HigkqOpte3YJHMowhKjrSBtFzbocouGF1Gs7R74B+6OOHk/dp7cM2wd1D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QIXp3d40; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D51C4CEF7;
	Mon, 23 Mar 2026 15:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774281382;
	bh=2cxH4u9j7HBt4tepb+AzkkHYs+Gdvh85t88nic+Sm+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QIXp3d40SV5BofGVa1QZR2yBEgZonN7YBoRmE4HqHjCcaYQxrzRP+kBwM70utkCIE
	 IGOLo7Vwyy7O7XEDPgxm4BJZpkvYw44jOxazqlML755KFKHIMlRHjmmYoTQJ/oUK1l
	 UBh15fprBBfVUy2thOu6WCDv7kApu60+QfKLJMS4iBBgQ7BUIcEOSfX78JeFLYXeP4
	 y5NOurlhIzUoQore5U7wSDN/sZLS5kl6d6gbsTow58qPglJ1UUkn9+UB5ntuFOKoXP
	 Bv7Tid5otVYNkaGtismC6Br2Y4zYaXDI7pC1+RkeX67wCF8DR0liQY4KUhZTq8q2+/
	 L0NEiq2HzEXQg==
Date: Mon, 23 Mar 2026 21:26:04 +0530
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
Message-ID: <bguhzabwryayyqkv4ilzwr3ixwv6bzxncblo3ircz2wm3fs52k@66zvcrfcb4oe>
References: <20260317-pci-m2-e-v6-0-9c898f108d3d@oss.qualcomm.com>
 <20260317-pci-m2-e-v6-6-9c898f108d3d@oss.qualcomm.com>
 <20260322233713.GA98177-robh@kernel.org>
 <to2mrizprc3hjufqbiplpqyek7f4uutqtn4hx4gkmdgv2rykbc@ybwwjhdec4nm>
 <CAL_JsqJXrHCJt770bJkMmAUhirSF3kHjYwSzkG7cXp7-eys8Rg@mail.gmail.com>
 <6aef3xxjjd4nbgrfx6jc6jt6rpqmttoui6hil5zqgdpas2j6gj@ie6j72orenou>
 <fsvmmgoe5wslmxebhrrwmdg2ldcmhzvj53gjkdfnfg2m2rz2lw@dcfboaakz7ae>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fsvmmgoe5wslmxebhrrwmdg2ldcmhzvj53gjkdfnfg2m2rz2lw@dcfboaakz7ae>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12200-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 31E502F83A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 05:14:30PM +0200, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 07:14:25PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Mar 23, 2026 at 08:39:55AM -0500, Rob Herring wrote:
> > > On Mon, Mar 23, 2026 at 7:16 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > >
> > > > On Sun, Mar 22, 2026 at 06:37:13PM -0500, Rob Herring wrote:
> > > > > On Tue, Mar 17, 2026 at 09:59:56AM +0530, Manivannan Sadhasivam wrote:
> > > > > > Lenovo Thinkpad T14s is found to have a soldered down version of M.2 1620
> > > > > > LGA connector. Though, there is no 1620 LGA form factor defined in the M.2
> > > > > > spec, it looks very similar to the M.2 Key E connector. So add the
> > > > > > "pcie-m2-1620-lga-connector" compatible with "pcie-m2-e-connector" fallback
> > > > > > to reuse the Key E binding.
> > > > >
> > > > > What is LGA?
> > > > >
> > > >
> > > > Land Grid Array
> > > >
> > > > > If not in the spec, is it really something generic?
> > > > >
> > > >
> > > > Good question. Yes and No! LGA is not something that Lenovo only uses. Other
> > > > vendors may also use this form factor. PCIe connectors are full of innovation as
> > > > the spec gives room for hardware designers to be as innovative as possible to
> > > > save the BOM cost.
> > > 
> > > innovation == incompatible changes
> > > 
> > 
> > Yes, I was trying to sound nice :)
> > 
> > > > This is why I do not want to make it Lenovo specific. But if you prefer that, I
> > > > can name it as "lenovo,pcie-m2-1620-lga-connector".
> > > 
> > > Depends if you think that s/w needs to know the differences. Hard to
> > > say with a sample size of 1.
> > > 
> > 
> > Sure. Will add the 'lenovo' prefix then.
> 
> Is it really Lenovo? Or is it some other module vendor, whose LGAs are
> being used by Lenovo?
> 
> I remember that DB820c also used some kind of a module for the WiFi card
> (which might be M.2 compatible or might not, I can't find exact docs at
> this point).
> 

I don't know. These kind of designs might be reused by several vendors. But
considering that we should not make it generic, I'd go with Lenovo as that's
the only vendor we know as of now.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

