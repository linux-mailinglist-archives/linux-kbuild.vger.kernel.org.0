Return-Path: <linux-kbuild+bounces-12788-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLQQGNpN32mFRQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12788-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 10:35:38 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0554020B7
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 10:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33538303A5DD
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 08:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F7D3D47B9;
	Wed, 15 Apr 2026 08:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K5UGAvvF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C9C39FCB4
	for <linux-kbuild@vger.kernel.org>; Wed, 15 Apr 2026 08:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776241899; cv=pass; b=Jj8Yk2a6ZJyg1f3t7mLl/pK1FDw7IvhCGqjZDKRZmDpu/ZrAP4zPzWoxl7mGN9aUgO6q+HUU4mtxz4HrGJ/KJORQjyeRGqJT1zvK0/7YJL5Hclg1cmlKJ2LpoDFL/Toynu9YyjjQHhBH9cMRdB9cI++6RZIiaupYfBzUtyLT3aA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776241899; c=relaxed/simple;
	bh=2vto3FW353Zu82QYk26GNUwn95iDmVTER564VnZJYjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cqteitC2bBL5adDgMcVv2WdOUzUDxmGAsZRjeGDWbDY2nqk5bpXrRsg6OcGdG0ndNoseXyx2oPrHKzBUXiBdE4tLuhlTce5PxFRKNr0EG161ToZzCYBGXjcoJMl1G8EEQR1MvFEjaVhUBQCG/dDBVcUfKkz4AP31Tu8r4FdhGss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K5UGAvvF; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a3d42263e4so5865863e87.2
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Apr 2026 01:31:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776241896; cv=none;
        d=google.com; s=arc-20240605;
        b=isDO3cVHPjB51n30v+t4dA8ktLZzU7vJBBiQNDvDtwBH10Sfs45ReTCI5ndapI4EKv
         gUETZ3wHT2KAj7qM7Yqnn3mKKmX7GBgq3V0adQdPsGjSovzCt4Ysg+lp7w0OaXPQh05f
         ATHYtTAqQobCtoEEt8M9FyRtOH1N+q/0jzWLmXS9sxmTcAy3er7tabdw05LEgUBxT2op
         sJxWw/77U7Bw3nJ3DruAoprTRwIE8qOgs8x3dZxsh2Gj91hpzdw1XrUgUZiBetPeGN49
         rb91jKE+bM4XBQEgiO7pet21Oni79NX0QfMgZGFsxX7pf5cbLTpfFVSKBee2FhBWA2Kj
         fnJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=75qqfi9qSpcNd5UITToYiihcYMMpTHFOID21ZWu5+AE=;
        fh=+q6oMSBxljRGzVZeZaDygpymIWChlfEDKWy/Ta9U5iU=;
        b=Mc7ivBXqrEhA/IrAWGctegwZXLGGeRdXD5pn5U8CdbqN2kGE9d9/guE5cQImOG+EH/
         q51M+Y7TLtZlIGtDNwX9QV8GkL87Tw+cO8yzrl+CrzS8wq1PvGoyI3sHMkGpsguUNtAx
         QfbDCKtHTj6LAgeR9KDI21ATLtJ2wRDpH8JZQj9xCPRJqyQKMj/4pZeZvRIe+5gRiocF
         4mwi2zojO/bGWN3Ic/SZQiw6uMYgJ0k4agYXENTrNSIyWiSen34Mcr5fvakSpPQ2Y2+P
         JEX2fTKLMSvuyt/DjYvivnQth8mj3w8IQzDM29mjpbFBe8SOMoLQGmsQD+wB21DRmbOv
         QQdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776241896; x=1776846696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75qqfi9qSpcNd5UITToYiihcYMMpTHFOID21ZWu5+AE=;
        b=K5UGAvvFYCw1lKIySpdxs+2VhQlu1DNfkQnTJo6uJshdmSwQBoqYPkYm885x67rk5A
         Sj0gGABTH/LttyV0M6yVENkD0MxhWEPS0tm4ubGvXt0SFTGMEnMnxewpxBPr/X9Kr5Cd
         qAZ5aXEbrM+4DvQYOBBKj/rlzLSiDmcR7mKsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776241896; x=1776846696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75qqfi9qSpcNd5UITToYiihcYMMpTHFOID21ZWu5+AE=;
        b=VQmN8jqxS3fcRspsYPTH1hFyf+hA7JqcMc7q8ish3JGmBcV/nab3Ix2ubFe4lc7cGW
         U3K/M1HBYSuD4Up6GgCkDQZdZ+n2+sS3/itPVyIAXF/3TV9BRXoAbhwZKmXa9fAM7cv+
         dwAXeAPaC1nLZuHA4R8jRn0c+8zdVCoFWPQ/ABZxi/yYE+HlivY13Ze0GTF7vQn7wU1i
         VlFWmCylpf6HhvqnBgpR/5fnI/1WACYiXRqk93UjoZA1lZQoK73/8ZNrIFQ7R+vRkBpT
         DhfCITmI/95QoLt6T6ROs675S3qHJPckfLhsCpc2ZWio8A8UoMhOhEQH/Q4TrhVWc+na
         +03w==
X-Forwarded-Encrypted: i=1; AFNElJ/eHf9YpIyQIOaUNdGMZ9gA/d5oAqUjfAf5m3/irtEyb53J18agx9Q+XKqWLbw/zfdE5q0ejVVMprt+g/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW94o7z+14X7zk5ye4MHMtpBYAvZ7yTa3P5Rvs7PPV2kXbZyVS
	kceBh8Oce8bA2rnsQQF/9gSN561hMpLSPOY8RFe+X9MhXDfjT/tVNlKXG5ygitbQXJVN1j4AVbx
	6fVh52bCaFXttwyY94NXJapaj4pL6fncf03lVNMPI
X-Gm-Gg: AeBDievU6uW+bf0abmzvjTeVrHLo3b1y9/v1yyWxHZzgSnqMOlOoKDgQl8BjIZ6XPAa
	loaj1sRzYbtxi2RzNTKA6nTO1FLujLMKVRQpR9aJ6/0deY48X4Ou7Vboez6PIew9HBII/Ob7ybr
	Bz3RS3ozBo8GTsgHW4TW/VxlFq8cE9JRkv9ZGwwwvOJSEI4TXuXd81M02UdCG+XjwM72wbITqSo
	PXBpUYP4zoRMeBqth8rTXyk8RM3/+Zpy5KVH09zx+6QeHm/vgOULRPgiTW+aZ24rreA8nzI4cgq
	C6ACvJFqTDncVyk0ziyToZVoj5Yj8RSPgAq6a1pgVSUt6QJQ
X-Received: by 2002:a05:6512:3e26:b0:5a2:a174:8958 with SMTP id
 2adb3069b0e04-5a3efb4968emr7410769e87.35.1776241895968; Wed, 15 Apr 2026
 01:31:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
 <20260413075459.GA2626902@google.com> <fpcs4p62f35a5qyqwgm5ysa73stbysxcr62tkmmkrrcvsuf4t4@4ivukyqjey57>
 <eeytuhqpgdz4do4tgtbmfntub2femtyq7bij7svhodpyjwaylx@j3gmvq2a2zqc>
 <CAGXv+5E=tujhtZjwi6Qm7hk3Ks74UzTQHWq82NiTEw1+vYod5g@mail.gmail.com>
 <ad36pIu-0dutL7Nk@ashevche-desk.local> <CAGXv+5EGe59nJctLweEdZjb3MNmMvjuCHngGSfptzN985OiLdg@mail.gmail.com>
 <ad4tJN27opdEooA7@ashevche-desk.local>
In-Reply-To: <ad4tJN27opdEooA7@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 15 Apr 2026 16:31:24 +0800
X-Gm-Features: AQROBzDzEraU5iaeBZSJUdxidhUdHObcnpB5nGLDAzHMGlTf0-gnuExg99lbWBI
Message-ID: <CAGXv+5EPA29G-fsH=wWOD8AK6TZFezFhsE0NHPYj_Pt3nT+d_w@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] Add support for handling PCIe M.2 Key E connectors
 in devicetree
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
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
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12788-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org,linaro.org,bootlin.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: EA0554020B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 8:03=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Apr 14, 2026 at 06:29:02PM +0800, Chen-Yu Tsai wrote:
> > On Tue, Apr 14, 2026 at 4:28=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Tue, Apr 14, 2026 at 01:03:19PM +0800, Chen-Yu Tsai wrote:
> > > > On Tue, Apr 14, 2026 at 12:08=E2=80=AFAM Manivannan Sadhasivam <man=
i@kernel.org> wrote:
> > > > > On Mon, Apr 13, 2026 at 07:33:12PM +0530, Manivannan Sadhasivam w=
rote:
> > > > > > On Mon, Apr 13, 2026 at 03:54:59PM +0800, Chen-Yu Tsai wrote:
> > > > > > > On Thu, Mar 26, 2026 at 01:36:28PM +0530, Manivannan Sadhasiv=
am wrote:
>
> ...
>
> > > > > > > - Given that this connector actually represents two devices, =
how do I
> > > > > > >   say I want the BT part to be a wakeup source, but not the W=
iFi part?
> > > > > > >   Does wakeup-source even work at this point?
> > > > > >
> > > > > > You can't use the DT property since the devices are not describ=
ed in DT
> > > > > > statically. But you can still use the per-device 'wakeup' sysfs=
 knob to enable
> > > > > > wakeup.
> > > >
> > > > I see. I think not being able to specify generic properties for the=
 devices
> > > > on the connector is going to be a bit problematic.
> > >
> > > This is nature of the open-connectors, especially on the busses that =
are
> > > hotpluggable, like PCIe. We never know what is connected there _ahead=
_.
> >
> > I believe what you mean by "hotpluggable" is "user replaceable".
>
> From the OS perspective it's the same. From platform perspective
> there is a difference, granted.

Yes. I just wanted to clarify.

> > > In other words you can't describe in DT something that may not exist.
> >
> > But this is actually doable with the PCIe slot representation. The
> > properties are put in the device node for the slot. If no card is
> > actually inserted in the slot, then no device is created, and the
> > device node is left as not associated with anything.
>
> But you need to list all devices in the world if you want to support this

Why would I need to? The PCIe slot representation just describes a
PCIe bridge. Granted this might not be entirely correct, but it's
what we currently have.

And even then, there are properties like memory-region or wakeup-source
that are generic and aren't tied to specific devices.

> somehow. Yes, probably many of them (or majority) will be enumerated as i=
s,
> but some may need an assistance via (dynamic) properties or similar mecha=
nisms.

Even if we wanted to add dynamic properties, there is currently no proper
device node to attach them to.

> > It's just that for this new M.2 E-key connector, there aren't separate
> > nodes for each interface. And the system doesn't associate the device
> > node with the device, because it's no longer a child node of the
> > controller or hierarchy, but connected over the OF graph.
> >
> > Moving over to the E-key connector representation seems like one step
> > forward and one step backward in descriptive ability. We gain proper
> > power sequencing, but lose generic properties.
>
> The "key" is property of the connector. Hence if you have an idea what ca=
n be
> common for ALL "key":s, that's probably can be abstracted. Note, I'm not
> familiar with the connector framework in the Linux kernel, perhaps it's a=
lready
> that kind of abstraction.

I'm not arguing for a even more generic "M.2" connector. The "key" is
already described in the compatible. I'm saying we should have some way
of describing the individual interfaces (PCIe, SDIO, USB, UART, I2S, I2C)
on the connector so further nodes or properties can be attached to them,
either with overlays or dynamically within the kernel. Right now the
are only described as individual ports, but we can't actually tie a
device to a OF graph port.

But maybe I'm overthinking the representation part. AFAICT for Qualcomm's
UART-based BT bit part, Mani just had the driver create a device node
under the UART (by traversing the OF graph to find the UART). If that's
the desired way then the connector binding should mention it. And that
works for me. But I think it's messier and also we're missing an
opportunity to make the M.2 connector a standardized attachment point
for overlays.

Mani, could you also chime in a bit on what you envisioned?

(Added Luca from Bootlin to CC, as I think there are parallels to the
 "Hotplug of Non-discoverable Hardware" work)


Thanks
ChenYu


> > The latter part is solvable, but we likely need child nodes under the
> > connector for the different interfaces. Properties that make sense for
> > one type might not make sense for another.
> >
> > P.S. We could also just add child device nodes under the controller to
> > put the generic properties, but that's splitting the description into
> > multiple parts. Let's not go there if at all possible.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

