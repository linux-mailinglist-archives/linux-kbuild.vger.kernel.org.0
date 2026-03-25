Return-Path: <linux-kbuild+bounces-12250-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCbHLFnSw2lLuQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12250-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 13:17:29 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5136C324B58
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 13:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 08F4D3012B4E
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 12:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02B83D3CE9;
	Wed, 25 Mar 2026 12:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b64J3S/9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEDB3CEB85;
	Wed, 25 Mar 2026 12:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774440381; cv=none; b=enb83HUOEJZa7qJqcmMsAu/muV8oHgc+HeByi7eR8zC8lXG3FGUUXZsTWL+M8Ym2zbdBi3PpSis2hjS82zZIQDlTwi9A57XJhUkq3Lp2K89hZcy+6d87aJocv37lqwvAsblejTOx2ovwYuHN6CbKxqbUodfrMJxAjkkBEW9smMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774440381; c=relaxed/simple;
	bh=ueF0hrvRluFMJ/+IsNDv2TY9qAQLpZVCChvf6GImWMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UePQYMMHUF/w8im0JJRCGP8h++AX33oeb2sMfRAch2CTvkZnnX/RQjpaJe9ZCqUtZXTY0mBolr4AD1TseUHjJwYkCH6lLc9I1+/U2YuwnLyfOaxQY85cECeCrvYVBPxO38SFSHrowpm/K9TT9JRrjTml+7m9OlhyIieIf77S+dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b64J3S/9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB30C4CEF7;
	Wed, 25 Mar 2026 12:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774440381;
	bh=ueF0hrvRluFMJ/+IsNDv2TY9qAQLpZVCChvf6GImWMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b64J3S/9wMpdMbsb28lUju0wP16mAjZXdtTfStiNijzPEkHs1QwjQqNJn9Vm96m4G
	 SesNnOOhFr1Av4MG+5BeUKnlWQbTn7LgkfIEGssQYGwMJXp7uc7C3mqUl+mJqux3Mz
	 7GVqbaVqgjEGvz6Dkath/TBSnChu4Yci0FfgPm2vMcRNKaevXioRglINXVrTJZU9MW
	 NstZ4onOipYfdbdsAS/lY7IdpfwvbAM5L8zb11Se6dTjuxRPVKptHkfpZpHB14zIix
	 egtrB549HcgGNnuMLCUyzdeVWiCIdft3TDwdf/Teh6A6NpfuRpF0LvSmjfIaruYB8r
	 /NaH//k6jNhlQ==
Date: Wed, 25 Mar 2026 17:36:08 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Greg KH <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	"Derek J . Clark" <derekjohn.clark@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
Subject: Re: [PATCH v6 6/9] dt-bindings: connector: m2: Add M.2 1620 LGA
 soldered down connector
Message-ID: <cvqdbqnzjmzoowxkvz2lyv4avropu5jw7h2r6zng3ecf245hgg@fsysjqflqd35>
References: <20260317-pci-m2-e-v6-6-9c898f108d3d@oss.qualcomm.com>
 <20260322233713.GA98177-robh@kernel.org>
 <to2mrizprc3hjufqbiplpqyek7f4uutqtn4hx4gkmdgv2rykbc@ybwwjhdec4nm>
 <CAL_JsqJXrHCJt770bJkMmAUhirSF3kHjYwSzkG7cXp7-eys8Rg@mail.gmail.com>
 <6aef3xxjjd4nbgrfx6jc6jt6rpqmttoui6hil5zqgdpas2j6gj@ie6j72orenou>
 <fsvmmgoe5wslmxebhrrwmdg2ldcmhzvj53gjkdfnfg2m2rz2lw@dcfboaakz7ae>
 <bguhzabwryayyqkv4ilzwr3ixwv6bzxncblo3ircz2wm3fs52k@66zvcrfcb4oe>
 <blhm4csjyw6r667cleljgzd6rpwagttjo5rau7wjrlnjakq2qm@ekyhc4jvwmwf>
 <m44mupdmg7kgco62n4evcviagqo7wwgyt3gybugbxwesd4ekjz@o24r6v4tpezc>
 <3faffec9-dc9d-4eec-a652-a84d30d85c96@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3faffec9-dc9d-4eec-a652-a84d30d85c96@app.fastmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12250-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linuxfoundation.org,linux.dev,linux.intel.com,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org,linaro.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5136C324B58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 01:23:07PM -0400, Mark Pearson wrote:
> 
> 
> On Mon, Mar 23, 2026, at 12:52 PM, Manivannan Sadhasivam wrote:
> > On Mon, Mar 23, 2026 at 06:45:15PM +0200, Dmitry Baryshkov wrote:
> >> On Mon, Mar 23, 2026 at 09:26:04PM +0530, Manivannan Sadhasivam wrote:
> >> > On Mon, Mar 23, 2026 at 05:14:30PM +0200, Dmitry Baryshkov wrote:
> >> > > On Mon, Mar 23, 2026 at 07:14:25PM +0530, Manivannan Sadhasivam wrote:
> >> > > > On Mon, Mar 23, 2026 at 08:39:55AM -0500, Rob Herring wrote:
> >> > > > > On Mon, Mar 23, 2026 at 7:16 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >> > > > > >
> >> > > > > > On Sun, Mar 22, 2026 at 06:37:13PM -0500, Rob Herring wrote:
> >> > > > > > > On Tue, Mar 17, 2026 at 09:59:56AM +0530, Manivannan Sadhasivam wrote:
> >> > > > > > > > Lenovo Thinkpad T14s is found to have a soldered down version of M.2 1620
> >> > > > > > > > LGA connector. Though, there is no 1620 LGA form factor defined in the M.2
> >> > > > > > > > spec, it looks very similar to the M.2 Key E connector. So add the
> >> > > > > > > > "pcie-m2-1620-lga-connector" compatible with "pcie-m2-e-connector" fallback
> >> > > > > > > > to reuse the Key E binding.
> >> > > > > > >
> >> > > > > > > What is LGA?
> >> > > > > > >
> >> > > > > >
> >> > > > > > Land Grid Array
> >> > > > > >
> >> > > > > > > If not in the spec, is it really something generic?
> >> > > > > > >
> >> > > > > >
> >> > > > > > Good question. Yes and No! LGA is not something that Lenovo only uses. Other
> >> > > > > > vendors may also use this form factor. PCIe connectors are full of innovation as
> >> > > > > > the spec gives room for hardware designers to be as innovative as possible to
> >> > > > > > save the BOM cost.
> >> > > > > 
> >> > > > > innovation == incompatible changes
> >> > > > > 
> >> > > > 
> >> > > > Yes, I was trying to sound nice :)
> >> > > > 
> >> > > > > > This is why I do not want to make it Lenovo specific. But if you prefer that, I
> >> > > > > > can name it as "lenovo,pcie-m2-1620-lga-connector".
> >> > > > > 
> >> > > > > Depends if you think that s/w needs to know the differences. Hard to
> >> > > > > say with a sample size of 1.
> >> > > > > 
> >> > > > 
> >> > > > Sure. Will add the 'lenovo' prefix then.
> >> > > 
> >> > > Is it really Lenovo? Or is it some other module vendor, whose LGAs are
> >> > > being used by Lenovo?
> >> > > 
> >> > > I remember that DB820c also used some kind of a module for the WiFi card
> >> > > (which might be M.2 compatible or might not, I can't find exact docs at
> >> > > this point).
> >> > > 
> >> > 
> >> > I don't know. These kind of designs might be reused by several vendors. But
> >> > considering that we should not make it generic, I'd go with Lenovo as that's
> >> > the only vendor we know as of now.
> >> 
> >> ... and later we learn that other vendors use the same idea /pinout,
> >> then nothing stops us from still telling that it's a
> >> "lenovo,pcie-m2-something-lga". 
> >> 
> >
> > How do you possibly know whether a single vendor has introduced this form factor
> > or reused by multiple ones? Atleast, I don't have access to such a source to
> > confirm.
> >
> I've not really been following this thread/patchset in detail; but want me to try and check with the T14s platform team if this device is specifically made for us (Lenovo) or not?
> I doubt it is - we just don't do that usually, but I can go and ask the question if it will help resolve this (with the caveat that it could hold up the review for a bit and I may not be able to get a straight answer)
> 

I can drop this specific patch in the meantime.

> My vote (for what little it's worth) would be to make it non-Lenovo specific. Then when the same part causes issues on another vendors platform I won't get asked questions about why Lenovo is breaking <other vendor> :)
> 

Even if Lenovo prefix is used, it won't break other vendors. Just that we will
end up adding more compatibles.

Anyhow, I'll wait for your reply and drop this patch for next revision.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

