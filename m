Return-Path: <linux-kbuild+bounces-12782-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBeyMRIX3mlBmwkAu9opvQ
	(envelope-from <linux-kbuild+bounces-12782-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 12:29:38 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B10233F8B0A
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 12:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F3F430055A9
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 10:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E933D6664;
	Tue, 14 Apr 2026 10:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CAg1W+YC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530D23D5649
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Apr 2026 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162563; cv=pass; b=OZ0q/YEltG40Op2P4ujveBMB/Q3/ebz7yqOIlkAAtBOrS9I2uzEkRktErMNz5oEw+auaq9R3BvtZUpEll1Q0eQ3nIjHah7czntbcX7B8uSOs9SKrlpRuDvp+Xg6V8NlhYefRO7lII3fSf+hvXN58Tp32+onQwd7YyTfpwMejPhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162563; c=relaxed/simple;
	bh=Ido82lTsBObPiLyE+cnbnYTa5RnXovthshiMl4cqqxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LfvLuXxA6dKwlJomwLcA2lCp7QAPxfTTXqh+SfnS633hD/eXqu0UgDrGh8dUNypmTn3Q6asDGg4YUMQU6HSEkoHol8hNhs5PwrFCEcBTlUgxEwP2JgLZQcX3RKS02Ib3max6THdPVf0mCblo/fRYq7Oms9LspO2XfD7gsSKACv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CAg1W+YC; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59e4a04f059so5019102e87.2
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Apr 2026 03:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776162554; cv=none;
        d=google.com; s=arc-20240605;
        b=VGOOVUlOB8PqzV3W0RchOx0OGs19eiEXjZjmxzNF+PWNMsZNbToSfcm42eihqO12Sx
         xNPbfMNxfpoUVDSGfWUT4qJ32cx+1o2HYwYubNprsx0gV5EK+SZi3KkTYVVZwepGjuag
         RJO4U7l8/5kDPtV6oGamRPxNVra42FsD7sxZR7vyq58TAGpy+rg51aYZQejgGspidfhw
         BsOm96H/ba4PaKilJN50f7bhhaUbL/m6TVj04kONFpwZalR/YGNlOQHmHQh1A8RUq8p6
         pnmT4g3s5mfndv3mdzLDQocV+ga8euwrO5oQmeijxP2TxKKNdkpvEArqimVOF0wiair1
         zxVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=obCwu9OJRNTUN7BsZbzZ8PH73jQ+TTI+BXXfuHZowXE=;
        fh=jxh1JgFfRqbNz4OdNqbar037l2rGfHjwJ5qXixUmFX0=;
        b=AP3ZqNiq6hYG7Da0SMac//vAo768WwFWZheaFfgxrpTVojCvkfYmkm4IdYgCeQRggl
         u5ju/1htljql/gJda5FtbbMMH2CuUEmY4/0bd8fI59mrO+vRDwKN300/uQuXVSZyLHpW
         pAStjmh8B+6ZUdOpWsASpTeBeaxumBSNmTCbEmkDzTrIY4pOu1fJE56NINYDvLqDe/Mb
         XYONynRoHaA42r9B2PRQwzB7fPqZIIFe8Vq+woVCtsAYF/BaCEK1HL48AAYn1pBwCjSs
         FzZDRbt8uCvv3309t14zRkAiD/6R7NerolAY1Ymmf6Y4cE1iGe55nPARydlXveuxCdq4
         xfsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776162554; x=1776767354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obCwu9OJRNTUN7BsZbzZ8PH73jQ+TTI+BXXfuHZowXE=;
        b=CAg1W+YCDWa+7hMyoFTX9wrJnea3anbAiHdxWmpDFPNhe7kCyRPxDRCs4+n9KcUSjl
         w6nzvTJigwS7oM6UFv5A3HKxmii0VyJz1d3VSyhkRHh9KbLCHy+zvkfyRpySbb5xZhZu
         JuL3QYV3wyDOI2wfxl8ehTcAnuZZDMlWKsh4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162554; x=1776767354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=obCwu9OJRNTUN7BsZbzZ8PH73jQ+TTI+BXXfuHZowXE=;
        b=L3K5JTfNiIrAFMZSEwrwl0msiqTAxeBo9/1JtuosVgyzIsBjvUMeIPF0GzHwmbDXz1
         ejnYm3lQlfkocI/z8BjU1VZ2x4rXD0B8+cIcjTgjaW5Xt/ThC5/RlTLpsLdlQ5VncJsD
         91t9b3xTqo2KBUlYLAHNdm0XFHnc/6n4BB2+E4P6/M9P6gZpxSMoDOnrOTZPo8qJbVpw
         Ls0rvz7DrseaZLCbIyfSt3gtyzrenrKJHGJS7YJeY8nzCmk39QtZeA+kvkyMuwi6DQ1S
         L2agN/Su6evYy7VU5TwB6/OeR78kUc24GwFF9g7XSf4lmoA2pE1j1ckVUwppva5bKVCu
         fn1g==
X-Forwarded-Encrypted: i=1; AFNElJ8nqoprIp3wlrGX6ujp77JEt32Rvjh6Z49wmWkkPzPFMyHC9j/UvbPn0O+BOzOssgpoPh/D6w+3LXpHNo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRRgrQ9wK9h9LCa4T1g2Uq0IzXSY2FenbcuF+30NxjUIKw5G2i
	eeVxQXp5Uh853CW0zDepUTVQdy4kWmxv5KwdWGTtqhMNkrDNaVncJd5lthuReqx1o9dfBNDL6Y5
	42yfvEGetUTFTqfVIvppFvY4mepHkJSiHps/sJ7OR
X-Gm-Gg: AeBDiesf6TPBvgk9UfP/KLPE4XSUTlzjxSZ7jkWCtReP/FyUDQ8JoyIh9FPPrBvTr8h
	3KUsi4wE04nHmu2sr6GKaOiBhFuNTxApDf0MLTC/0C+9KX1h9JuBmxwI5ElsTNN+1m1+uhIWd1g
	lKWhphwdS1jqRITxyO4DTt9KgiUhGwsHtUvlDfmCQhx4vIBG7axs1o0bmtiinM5HSWBMzq/mB4+
	x7wv2rAA+Wn6W6f6n71+QmHrfCzJSJh8Aut2JPQwXXonj8bZ7e/tkNwo3g0oBz4ONnO/lPMGv6H
	euUaHYwMtHb9douKUjktmqD9t/ZsUCQqb7630j+iEt4+odCE
X-Received: by 2002:a05:6512:68e:b0:5a2:ae27:c879 with SMTP id
 2adb3069b0e04-5a3efd7f0d8mr4850095e87.29.1776162554447; Tue, 14 Apr 2026
 03:29:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
 <20260413075459.GA2626902@google.com> <fpcs4p62f35a5qyqwgm5ysa73stbysxcr62tkmmkrrcvsuf4t4@4ivukyqjey57>
 <eeytuhqpgdz4do4tgtbmfntub2femtyq7bij7svhodpyjwaylx@j3gmvq2a2zqc>
 <CAGXv+5E=tujhtZjwi6Qm7hk3Ks74UzTQHWq82NiTEw1+vYod5g@mail.gmail.com> <ad36pIu-0dutL7Nk@ashevche-desk.local>
In-Reply-To: <ad36pIu-0dutL7Nk@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 14 Apr 2026 18:29:02 +0800
X-Gm-Features: AQROBzDHB_HCwto4iaprIWgL7mrQWt62yIrtGAtxckKlX4EUkJwTT3ZqPu-YslU
Message-ID: <CAGXv+5EGe59nJctLweEdZjb3MNmMvjuCHngGSfptzN985OiLdg@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] Add support for handling PCIe M.2 Key E connectors
 in devicetree
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Bartosz Golaszewski <brgl@kernel.org>, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12782-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org,linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,mail.gmail.com:mid,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B10233F8B0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 4:28=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Apr 14, 2026 at 01:03:19PM +0800, Chen-Yu Tsai wrote:
> > On Tue, Apr 14, 2026 at 12:08=E2=80=AFAM Manivannan Sadhasivam <mani@ke=
rnel.org> wrote:
> > > On Mon, Apr 13, 2026 at 07:33:12PM +0530, Manivannan Sadhasivam wrote=
:
> > > > On Mon, Apr 13, 2026 at 03:54:59PM +0800, Chen-Yu Tsai wrote:
> > > > > On Thu, Mar 26, 2026 at 01:36:28PM +0530, Manivannan Sadhasivam w=
rote:
>
> ...
>
> > > > > - Given that this connector actually represents two devices, how =
do I
> > > > >   say I want the BT part to be a wakeup source, but not the WiFi =
part?
> > > > >   Does wakeup-source even work at this point?
> > > >
> > > > You can't use the DT property since the devices are not described i=
n DT
> > > > statically. But you can still use the per-device 'wakeup' sysfs kno=
b to enable
> > > > wakeup.
> >
> > I see. I think not being able to specify generic properties for the dev=
ices
> > on the connector is going to be a bit problematic.
>
> This is nature of the open-connectors, especially on the busses that are
> hotpluggable, like PCIe. We never know what is connected there _ahead_.

I believe what you mean by "hotpluggable" is "user replaceable".

> In other words you can't describe in DT something that may not exist.

But this is actually doable with the PCIe slot representation. The
properties are put in the device node for the slot. If no card is
actually inserted in the slot, then no device is created, and the
device node is left as not associated with anything.

It's just that for this new M.2 E-key connector, there aren't separate
nodes for each interface. And the system doesn't associate the device
node with the device, because it's no longer a child node of the
controller or hierarchy, but connected over the OF graph.

Moving over to the E-key connector representation seems like one step
forward and one step backward in descriptive ability. We gain proper
power sequencing, but lose generic properties.

The latter part is solvable, but we likely need child nodes under the
connector for the different interfaces. Properties that make sense for
one type might not make sense for another.


Thanks
ChenYu

P.S. We could also just add child device nodes under the controller to
put the generic properties, but that's splitting the description into
multiple parts. Let's not go there if at all possible.

