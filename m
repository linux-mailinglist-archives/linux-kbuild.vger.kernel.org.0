Return-Path: <linux-kbuild+bounces-13698-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RHf1OPaXKWoxaQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13698-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 18:59:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA45266BC34
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 18:59:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bLXPA9rO;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13698-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13698-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 432B13079EA3
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 16:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20C52874F8;
	Wed, 10 Jun 2026 16:45:12 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DD525B0AF;
	Wed, 10 Jun 2026 16:45:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781109912; cv=none; b=bZ1REEULpzjk6QrBzzqCpO6BL12nmDgZ/J9hZ8N3QGNmPDrxkEetiOJzE05Uq8glLpVrEwA8eXl8nlucF4bASOD3ksKKUe/1r+KKh0F1KJK5i0IefF1gcI7btA4VDWfZ+vEIZhNqHtv3xXu1mdGOqLmvdH7pmLNXavmIG0Ff5pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781109912; c=relaxed/simple;
	bh=+ZB6Da2HWvZYv1vmMvNe9eSUtjNUaw1y1O1JZQiS8vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=niFV1otHXYl6oVPFLwu1wC25jg8ZH+jEIJORoIUHjJWvpRJlkRLuMj47RBEteOK7nxywr11O5/BS0Q1sMEAibdd2h5r6bvNfpDx9qg7BaTUre0iyXJx5glFnp+imaIflFS8gKnKAkJT/ZvHvIAbRHAjezdJ7FelUXWM87MVOL2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLXPA9rO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204C41F00893;
	Wed, 10 Jun 2026 16:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781109911;
	bh=6gdHQGQUI+RdS7ZUuS8+/hjC20f5GnX3T6BFhRH2P2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bLXPA9rO+CKusqWUFkWKhbKrp6tW2aIKa+NIauigC5cJwmRCgLxstOPB94tmjJNG6
	 eSnRtD5GsbKwFlWL5YfD4r6riqyBJS0zRIXYfgtix9QQ5OIAMJIqC8n0BRyI3J/JmL
	 svlTyYKRiyt41Q4fftHHNx0DPaJYPSPUe3SWNQxLQo3L5sgfS68KeKuIJ5tJ0AjK9L
	 c2TTpOSfgiT6dbuYT0X2Yrx1WT510CcZ/YPY/8EJKTYuyBW3s1YIkCA8KTGPOx3kud
	 Sa3cexcbI+BiXiN/bp7/XfOTHDdH5dZ8THH4ZSUZjQuzf+XfW5NyIW+XpTnB38sPEs
	 js2pkyRxv2Ifg==
Date: Wed, 10 Jun 2026 18:44:59 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Greg KH <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, "Derek J . Clark" <derekjohn.clark@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
Subject: Re: [PATCH v6 6/9] dt-bindings: connector: m2: Add M.2 1620 LGA
 soldered down connector
Message-ID: <eftahohsx3bbvmgxuciofjjcrybnsm2qc752hwyt65rb2uwaon@h32nh5fcpo7p>
References: <to2mrizprc3hjufqbiplpqyek7f4uutqtn4hx4gkmdgv2rykbc@ybwwjhdec4nm>
 <CAL_JsqJXrHCJt770bJkMmAUhirSF3kHjYwSzkG7cXp7-eys8Rg@mail.gmail.com>
 <6aef3xxjjd4nbgrfx6jc6jt6rpqmttoui6hil5zqgdpas2j6gj@ie6j72orenou>
 <fsvmmgoe5wslmxebhrrwmdg2ldcmhzvj53gjkdfnfg2m2rz2lw@dcfboaakz7ae>
 <bguhzabwryayyqkv4ilzwr3ixwv6bzxncblo3ircz2wm3fs52k@66zvcrfcb4oe>
 <blhm4csjyw6r667cleljgzd6rpwagttjo5rau7wjrlnjakq2qm@ekyhc4jvwmwf>
 <m44mupdmg7kgco62n4evcviagqo7wwgyt3gybugbxwesd4ekjz@o24r6v4tpezc>
 <3faffec9-dc9d-4eec-a652-a84d30d85c96@app.fastmail.com>
 <cvqdbqnzjmzoowxkvz2lyv4avropu5jw7h2r6zng3ecf245hgg@fsysjqflqd35>
 <acv2f1qbqu4PlSL1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acv2f1qbqu4PlSL1@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13698-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:mpearson-lenovo@squebb.ca,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:nathan@kernel.org,m:nicolas.schier@linux.dev,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:derekjohn.clark@gmail.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:brgl@bgdev.pl,m:andriy.shevchenko@linux.intel.com,m:brgl@kernel.org,m:linux-serial@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:derekjohnclark@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-kbuild@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[squebb.ca,oss.qualcomm.com,kernel.org,linuxfoundation.org,linux.dev,linux.intel.com,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sparklan.com:url,h32nh5fcpo7p:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA45266BC34

On Tue, Mar 31, 2026 at 06:29:51PM +0200, Stephan Gerhold wrote:
> On Wed, Mar 25, 2026 at 05:36:08PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Mar 23, 2026 at 01:23:07PM -0400, Mark Pearson wrote:
> > > On Mon, Mar 23, 2026, at 12:52 PM, Manivannan Sadhasivam wrote:
> > > > On Mon, Mar 23, 2026 at 06:45:15PM +0200, Dmitry Baryshkov wrote:
> > > >> On Mon, Mar 23, 2026 at 09:26:04PM +0530, Manivannan Sadhasivam wrote:
> > > >> > On Mon, Mar 23, 2026 at 05:14:30PM +0200, Dmitry Baryshkov wrote:
> > > >> > > On Mon, Mar 23, 2026 at 07:14:25PM +0530, Manivannan Sadhasivam wrote:
> > > >> > > > On Mon, Mar 23, 2026 at 08:39:55AM -0500, Rob Herring wrote:
> > > >> > > > > On Mon, Mar 23, 2026 at 7:16 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > >> > > > > >
> > > >> > > > > > On Sun, Mar 22, 2026 at 06:37:13PM -0500, Rob Herring wrote:
> > > >> > > > > > > On Tue, Mar 17, 2026 at 09:59:56AM +0530, Manivannan Sadhasivam wrote:
> > > >> > > > > > > > Lenovo Thinkpad T14s is found to have a soldered down version of M.2 1620
> > > >> > > > > > > > LGA connector. Though, there is no 1620 LGA form factor defined in the M.2
> > > >> > > > > > > > spec, it looks very similar to the M.2 Key E connector. So add the
> > > >> > > > > > > > "pcie-m2-1620-lga-connector" compatible with "pcie-m2-e-connector" fallback
> > > >> > > > > > > > to reuse the Key E binding.
> > > >> > > > > > >
> > > >> > > > > > > What is LGA?
> > > >> > > > > > >
> > > >> > > > > >
> > > >> > > > > > Land Grid Array
> > > >> > > > > >
> > > >> > > > > > > If not in the spec, is it really something generic?
> > > >> > > > > > >
> > > >> > > > > >
> > > >> > > > > > Good question. Yes and No! LGA is not something that Lenovo only uses. Other
> > > >> > > > > > vendors may also use this form factor. PCIe connectors are full of innovation as
> > > >> > > > > > the spec gives room for hardware designers to be as innovative as possible to
> > > >> > > > > > save the BOM cost.
> > > >> > > > > 
> > > >> > > > > innovation == incompatible changes
> > > >> > > > > 
> > > >> > > > 
> > > >> > > > Yes, I was trying to sound nice :)
> > > >> > > > 
> > > >> > > > > > This is why I do not want to make it Lenovo specific. But if you prefer that, I
> > > >> > > > > > can name it as "lenovo,pcie-m2-1620-lga-connector".
> > > >> > > > > 
> > > >> > > > > Depends if you think that s/w needs to know the differences. Hard to
> > > >> > > > > say with a sample size of 1.
> > > >> > > > > 
> > > >> > > > 
> > > >> > > > Sure. Will add the 'lenovo' prefix then.
> > > >> > > 
> > > >> > > Is it really Lenovo? Or is it some other module vendor, whose LGAs are
> > > >> > > being used by Lenovo?
> > > >> > > 
> > > >> > > I remember that DB820c also used some kind of a module for the WiFi card
> > > >> > > (which might be M.2 compatible or might not, I can't find exact docs at
> > > >> > > this point).
> > > >> > > 
> > > >> > 
> > > >> > I don't know. These kind of designs might be reused by several vendors. But
> > > >> > considering that we should not make it generic, I'd go with Lenovo as that's
> > > >> > the only vendor we know as of now.
> > > >> 
> > > >> ... and later we learn that other vendors use the same idea /pinout,
> > > >> then nothing stops us from still telling that it's a
> > > >> "lenovo,pcie-m2-something-lga". 
> > > >> 
> > > >
> > > > How do you possibly know whether a single vendor has introduced this form factor
> > > > or reused by multiple ones? Atleast, I don't have access to such a source to
> > > > confirm.
> > > >
> > > I've not really been following this thread/patchset in detail; but want me to try and check with the T14s platform team if this device is specifically made for us (Lenovo) or not?
> > > I doubt it is - we just don't do that usually, but I can go and ask the question if it will help resolve this (with the caveat that it could hold up the review for a bit and I may not be able to get a straight answer)
> > > 
> > 
> > I can drop this specific patch in the meantime.
> > 
> > > My vote (for what little it's worth) would be to make it non-Lenovo specific. Then when the same part causes issues on another vendors platform I won't get asked questions about why Lenovo is breaking <other vendor> :)
> > > 
> > 
> > Even if Lenovo prefix is used, it won't break other vendors. Just that we will
> > end up adding more compatibles.
> > 
> > Anyhow, I'll wait for your reply and drop this patch for next revision.
> > 
> 
> If you need a vendor prefix, I think "qcom," would be more appropriate
> than Lenovo. This form factor is used by most vendors for recent
> soldered Qualcomm-based wireless cards, not just Lenovo:
> 
>  - Dell XPS 13 9345 has exactly the same soldered M.2 card, I assume
>    there are several other vendors as well.
> 
>  - https://www.sparklan.com/product/wnsq-290be/ is a third-party
>    (Qualcomm-based) M.2 LGA 1620 card, in the block diagram the
>    pinout is called "QM.2 1620 LGA 168pin".
> 
>  - If you press F9 while booting the ThinkPad T14s, you should get to a
>    screen with "Regulatory Information". For the T14s, this screen says
>    "Contains FCC ID: J9C-QCNCM825". This is the WiFi/BT module in the
>    soldered form factor. If you look that up on the FCC website, the
>    applicant for this module is "Qualcomm Technologies, Inc.". This
>    seems to be some kind of "modular certification" that vendors can
>    reuse/adapt without going through the whole process again.
> 
> Perhaps you should ask around inside Qualcomm? :-)
> 

Sorry for getting back after this long. I did ask around, but our HW folks are
saying that Qcom is not the first one to use LGA M.2 modules. They claim that
other vendors also do that.

But for this specific card, it should be fine to use the 'qcom' prefix as
apparently the module was supplied by Qcom.

I'll submit the bindings patch together with DTS change for T14s.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

