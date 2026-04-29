Return-Path: <linux-kbuild+bounces-12909-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGIeMmFT8WkLgAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12909-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 02:40:01 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C74348DCB2
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 02:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB4533078C6A
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 00:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25185212542;
	Wed, 29 Apr 2026 00:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ligiHFGm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAB91FC10C
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Apr 2026 00:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777423151; cv=pass; b=Vae1/246+w9ANnGv0+qmAjPAsd6Q4Ul2WFVGY0Dq5svJWApfKqdLq3GY9PdC7pjVjOyvsgjrSS9cSW9bsvyJyCJTYkXvkOKd2DVTFVnXEcNRBPFvhgCZntdWn3dKS6/ZGcy3h/BzO1+RP4OncP7f0F8RlJRUhaVzzYRXYSphnio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777423151; c=relaxed/simple;
	bh=lnq+RzcTqQApY6vrzuon4NmVdC+fOyrYiS6n6xe3zDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oc5ohNpKNoSg3wbZ0ajvLdiANoKsS4/zufH1YsPpHcBryZ2ON4JXdMyWoJxoHqHvIMV0DVv45NmYhMiI8C53Y2HydauwJUuDFrlcSFYyq1aXfye+LBMGErG8SrH8K23k55ML2ay0chpUvO8VS6GHUCc7Y6kkTw+zbO1kcMNF4m0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ligiHFGm; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2daaab98000so679682eec.2
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Apr 2026 17:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777423149; cv=none;
        d=google.com; s=arc-20240605;
        b=gPHIOaciXZZzuCKWkgBTzRwRLvNBxwnVm3u1/T6P2EZjysUaXrCX79/VGScxGhlz3O
         dvClvYX3AbKYVHTXEdCAk0sIbVtLf+YWV/DuHq8zQgDxXzbdtI9Motcs7MTZK/rHL4Hu
         dW59qHED4c1LmesnEx0Wm9KKMLDETIOpNN4zkydL/PJOg5ZglMOUVgoadHtk0xdr9QoY
         yJWQ7rBXuaQKibRgC1fS1s8eLwuo1Y3rwZjMj2eRhpYG5xtmsbBAUstCi3/r0Ul4c28W
         7HMoEyLJvzYqvZnBHLJh+iN4R2dAv54n+z4aCRNQW2TkbOBzEs2cQLIVbfO30ZPz1Cnb
         +z3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lnq+RzcTqQApY6vrzuon4NmVdC+fOyrYiS6n6xe3zDE=;
        fh=ZXhdkdm3eTlf55a/Z1VLuihOWNI6fWqqNkjDTLaXcKE=;
        b=WX58MYx6Uzm6iWAR6ywni7hE6PPWQ9Bk034dhKhFi/RpXiatc1sAGzFaGirEyGLHKF
         ZxFseXCzAaCFOquNSr4fGKCRzonJRF0vEgbGCRv6iHw8D4doBBiqVtsZTy6i0/j4kDLT
         9iuPgjT1XNSsPKvRsX05c4J5eEzD9Z7/VYMAICZC+lJPcMCxRgDiv8xfDFuaRrTwI186
         rrFCIc4jHSOVQhejTH48AS6GXlRVjrKGeAG0lQ1Xwcs9wU4EqbZ1P2NBPQ86dhI80Uuv
         ntDboywpdXcDLWED+EnpAQNPUNN4rDkei04MKJgFhLQpHC4BRYzlOiIp78t/sda8aMrn
         zwVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777423149; x=1778027949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnq+RzcTqQApY6vrzuon4NmVdC+fOyrYiS6n6xe3zDE=;
        b=ligiHFGmoEzy02s+aQEWyPs8/vVgGjhf+LWOxkCgUvFlz8wHcDJQJI/jPWqJgTlg7Q
         Qzo7GkcBSJjFK1ScFqM8GxGMlaYfGeIzywTunlJUgFErhjGkfzuGFrwxjzXVQcmoRcAj
         o6WU0tJU+2C4zb+cxC/NTzvXvCDQ2qGesvZPeV4g2JQcb6nRBTGV8E+zksy/y9kq8jgY
         oNLgPrsKYgwJD4EPedYqyP/7Ssd+DRcFRTo3l4l8+35LzQC25zeb6tq1XwXF4pCUFkDW
         0JqvW3aL2WmFPW75E4IU157ILtX+ZZsm16rCgo/XywiM/wi9hEWfItgE7fY+EsP8y1VR
         C/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777423149; x=1778027949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lnq+RzcTqQApY6vrzuon4NmVdC+fOyrYiS6n6xe3zDE=;
        b=aFgLL/GnElzG6v+0IHDKEbDT8HcJ0M83cmDT4dos7MCaRGuhUcqkBEaqAaFK0l3i0M
         x08zAf39Ll4DSE9QS7fG958m7AtujcacXiiFiEaU2ejXYBa/Yt8VaD9Hn0LCRXIZNFO4
         LevKcsWZlwZw+QOsI1TIYbgPpFbloc3ZFs4WI2t7VJ7O2KjD4Ea2WRG5kMmSHOwu92bc
         LJdvC2JohRlmf5WkS0qK4KVaDvAUvqriUmGDghDOeVjbUNrU5KS2SCRr4p9A2BrW9YWd
         EYVrLT6+EC3+KfbSf2KIHkCuW7fmf3Uc0wI/b3xtIsScGK8W28kwgKJUxGMchy2siydm
         DIrg==
X-Forwarded-Encrypted: i=1; AFNElJ9sXJog6OSeFKptdRb07Ewq69z3Xd+Niy2a2rsF56ZjJF3lpBy+Uqdm8gm+reyB2q1TSVFYVejhuWn5BRI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk59GpgfJtTbnFV2+wHga3BlFKb6EETQgY5V4xt98Z2uSeBfyY
	kCv64FXbGr1kaaHi+6PaNRg7fQ0M9C6K7WiWhBViGYi8z/l88n7jAyYDX4HNmLjpD/ssx3KI00Y
	PdejAXeGoSGiho2cPoCz77f0hsvkEqt0=
X-Gm-Gg: AeBDietUN8TdWubwI4wbg3rSpbOp9ppABzW59I580eaikCf9vdT2fcXRre3azX7+NHP
	f0OrXVoPwbv/429ekGH1XQvoOKrlJTozIeqpgK8Sh93QbMngwnSkHU4+WOaanlBXSWkY/Z1DVlN
	xFEkaNO0Xawc5eeA0jZ/dIszy37WeQXK9hNGbPVH3rjjGf9woVYBDMcKUR38oTzfdTZf37sli0n
	ypRUNwNEVGbXPeSRprgH7uWHKOsWXqC8q2sA+skkJsKdfHkLxeNABcP1pBjOmGh4K35FpNDLMFH
	hYGA2gTavOpkPDAidyYfMn2wWW73NjDj4Ts5E1k/tS9HWP6/PORWI1lfMarL5jyZ3uyFpiNSuEv
	Jg0iQaoFT3hHjWDBxies+ZqJGGesekqXT2A==
X-Received: by 2002:a05:7301:fa0a:b0:2e5:5bf4:886c with SMTP id
 5a478bee46e88-2ed09bc6856mr1151978eec.5.1777423148670; Tue, 28 Apr 2026
 17:39:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-3-julianbraha@gmail.com> <CANiq72=nCw+zWYhvPMJiG8oOT3zpaD8eGVUgaK5rnSzAiGGjPw@mail.gmail.com>
 <607be3b2-11bc-4074-a396-39da73089b74@app.fastmail.com> <CANiq72mEgpe-UGMQ_YWb8SKsY96Oc0b4sQ_MKvhMDVkNC9WvQA@mail.gmail.com>
 <20260428184511.GB3304253@ax162>
In-Reply-To: <20260428184511.GB3304253@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 29 Apr 2026 02:38:55 +0200
X-Gm-Features: AVHnY4Jhkf1YJCEOdRRUOwzbTzh7X94i3-EvhUl39GdPP65emmpf3WcLQ5yzpF4
Message-ID: <CANiq72mToO-jvEqE7VyqU6u1GK=bO-U+FD4Ei0c9HOgyzM+53Q@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] Documentation: dev-tools: add kconfirm
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Julian Braha <julianbraha@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, ljs@kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6C74348DCB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12909-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[arndb.de,gmail.com,linux-foundation.org,kernel.org,linuxfoundation.org,lwn.net,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

On Tue, Apr 28, 2026 at 8:45=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I agree with the sentiment that more host tools may want to be written
> in Rust. The Rust build in the kernel does not use cargo altogether, do
> we want the same restriction for host programs? Would these tools be
> able to share the Rust build rules so that we could have a simple
> hostprogs syntax for tools integrating with Kbuild to use? Obviously, it
> might be harder for some programs not to use some of the nice third
> party libraries available but it seems like it would eliminate the build
> system considerations from the discussion at that point.

Yeah, we have already 3 hostprogs in the tree, which just call the
compiler, but it would be nice to have a way to use ecosystem crates
for those and userprogs etc., even if just a particular vetted set.

Otherwise, it is quite painful sometimes to use Rust, and one may
prefer something like Python instead (like we did for
`scripts/generate_rust_analyzer.py`). Python works great for many
tasks thanks to its standard library, but we lose the advantages of
something like Rust. On the other hand, Rust without a few crates to
support certain common things isn't great.

I wouldn't say it is a rush, but it would be nice to agree on an
initial vetted set and try to set something up so that eventually it
is easy to write scripts/tools/hostprogs in Rust going forward.

We could also consider an earlier MSRV for those, i.e. lower than the
kernel image one, if that would allow us to use it in more places,
like for hostprogs without assuming `CONFIG_RUST=3Dy`. Say, Debian
Oldstable instead of Stable.

Cheers,
Miguel

