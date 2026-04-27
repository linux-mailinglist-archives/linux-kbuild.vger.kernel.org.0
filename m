Return-Path: <linux-kbuild+bounces-12893-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLcSOcvR72nZGQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12893-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 23:14:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 800EC47A8E3
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 23:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DEB0302F24A
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 21:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56FC63AB285;
	Mon, 27 Apr 2026 21:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aLMCR4lg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049D93AA4E2
	for <linux-kbuild@vger.kernel.org>; Mon, 27 Apr 2026 21:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777324488; cv=pass; b=uyXQPmMdPK+/M4H77BlEJ4ukOlo7zdDW8zG3S+ZBRpzfcgKkWD3skJzI1HrpvDsz3+eWaEKvcpvLW6WMkvdzCM5jTQ5/3AjuLUxcrkXdwmXt2ZrM+fLcyu758FfnpXlQ3UqqOX7IC8nZnd0lANiGWIkM6I2QvNiqTCDdS0Ws4js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777324488; c=relaxed/simple;
	bh=L3gxijYjb8ZuqVwBqymDvkEPWDLJisWCndpnbSKbC4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+ZRTCfcXLAnaKiqAsPpm1kizXo7LX5MNry4p6RSEG69AYBQPT5pieoAvVESZxaEPxjDh7aYJSGbQnGW3eJBEXt5iS/SF189U4e06eJLE9XNCFMnHUDSRQNik0clLxk1NltLjrQJm//ZPd/8ZpltfY3awAPR2N1meghdM2pWnKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aLMCR4lg; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12ddbe104ccso909700c88.0
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Apr 2026 14:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777324486; cv=none;
        d=google.com; s=arc-20240605;
        b=VLzAh1uMN8LdjDUpB080Z96RoLeRvdzfZxEbNTrdc9K2ATtSOweDIITGisThcsRiNZ
         1ftG5ZHX6HEZMPOZDMFPJI3i7fYxlRBNCAdNzMut/GJTrKTq0rEXjL0Ro3LaYd+baZNP
         R64zhFRywWgLnRz5aueVf8SeQsFlWTltFwwIWMlijre7Xf8vxPTD6s7/avbK9vgHtx0X
         FwN9/tQNRtnVvEYZLUOeAdY1WhJjXZq0OgeO26FqDSdrnKXMOsPeR0aYpOPeYfzwF+8B
         UU03KYx+zBGw4aYf/fjFm/yvhOjYwaD4cgrecdLDJ+vchfzwfzj+bqROw7Zi1U4OUgn+
         YpUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yTMfnNHew4Z3Vtq+JLgckRwp3mN20O7br6ag7ZoECUY=;
        fh=TrC+8TqyNxt9yUu2lS6CkDXeyqosP3riw9QHnsYkHuc=;
        b=eXSBohBmNgH41kItCq0SGIf5GDaGEH7Cv7Q/zLLebct2Q9fUqNJzovlf0BKZZJig0Q
         lqkD5H0fVa0wc9mXUm2+2HKUntNGVkTUxl5VMCkU0mYZjzkCc0HH5nnwT/fiyzFgZ3KX
         lWqFRGJtafmHSJ0+MtAoMVh6bKJ1EmFkLaoOpWm/Fh6KxirBiEd+c7qqmKTkdqnMMThz
         1nT10CHZJ1LRc4BX+sqh9jyFaqTPZ4Jim3ucFPDk5rrtpzFk7kKaqRcHgnOofRe3Xv5w
         5Nhi38YfKHz+ZEjM3Bqy+PO7a8o1cjiQ9xbu8PHTwkKmhwmDESEguip3kLN5/mekML1x
         uXIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777324486; x=1777929286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTMfnNHew4Z3Vtq+JLgckRwp3mN20O7br6ag7ZoECUY=;
        b=aLMCR4lgFS3GmLrTtkY7pWQgUbmk5p0zV0ENfECMIiSWaytXkbNqJ4qRjWkmO2ugIn
         53D8+avx01Q6zoful7sG1g0U4secufDeoRr8G5DDOcqSlZEGE9pWHzoP3MvaEwLYcDk6
         oO+NuMQHwCK0XiYQpSRyTheeXqOSENlsRXNRqQoF4HmIifxStpKFVUUXjFlOqBejGIzB
         jzq/GNnlNI+btWK4F9di9ppc7YEDM2mmEyGNzR1ikwgi94Qm2vqf+UVn4aPBW/E6kvdv
         PjsY1t5cgQB+MbfAzJzEJDaaFjhGuOu9yKc+CaXCbeR54zWyisxlAHiI9M1n0Y8OY5ur
         5tKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777324486; x=1777929286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yTMfnNHew4Z3Vtq+JLgckRwp3mN20O7br6ag7ZoECUY=;
        b=Z4bvNnoc6kXoS9vZDb/goTwBTrnN0qzPUWPRckstdBMq0quSddHuXeKPN9ed7sKnyf
         /lJ2bMG9sijDRQrpVHgrbKzoCiML5GTUQlLHxwjXE1t3jz3cLFALKOPpCDZ/EIJVjhNI
         Dhm1CyPyjRSPLAUV6A+UjI1m/yZGzdCdu6e+ecVsjW6HRBWijx/X+5IC6WnD7Tlf9UVF
         CGEyvlsoILxEahrz9pR2cK8WikYnf8Ocw378hqLDGf0A2N/qwg06dnRmxWfp10zSXW5I
         +573oM8pPW04r9ylnT8ILynMzT0CS68d16aLun9E8ZyvDaTPnQeYn1Jx/U92YiP5a0ll
         SSWg==
X-Forwarded-Encrypted: i=1; AFNElJ8asb/aqsy/g6TeElfkOgUB4PFlDdn+S2rfwZzOk22J64KzgjQpzs0s8zNP7TpxkrUHwaroriCkQ/bRkqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIWfcVxTrnijSCfR9zCazisxnIhH3t2mdFaR7wTVsdynk+h+pY
	h5GNa65PxO5j4VDpsm5q3h8i8W29DgcHwyPb0UC5JXy1D8qLRxjxJ+nu6kELoRnTiJW5l+jKZD5
	bpuw7caHrU2bop66JSL0d4fcRDV2wffeZjRPcHP8=
X-Gm-Gg: AeBDietY2L5uiME33SAhT0G/Vg4/jKqprdpTZBUxrvXtbOtO5SEY6f4LPPc8awSCrX0
	roPUfSqcGAlFMc7YKDohfdK2Zz8+AbnQkwiM1Zs1QKj5U2PVGYV+xtXa8a0+aIlCSjrCGQkQTNU
	u3FgxC6PPPA6DV7WhCiVeT8qgKWGZuh5eKza2Gf1+etIRr7g6dybsz+9BnCHzsRsrYLtIhrfnHg
	Ji+OyuF8RjGJka/yFvDQxO26Fq1ydt+iQ8jjQFQycoTMVYVj2aW3PPefVhcY/RmFDY+HsSAtms8
	+awhsyLkqo3qGz7vWwaWnMnMyXDTdf1TxTeGmvylZYsCvqbAmrCF20qxAqrjOftx5RinqbCCVpw
	rxpFiYR8Fnf/3ra2fjzvthKq2fEg=
X-Received: by 2002:a05:7022:698d:b0:127:3b1e:7e0e with SMTP id
 a92af1059eb24-12ddd98bd51mr334421c88.20.1777324485570; Mon, 27 Apr 2026
 14:14:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1896318894.249754.1777018724256@app.mailbox.org> <20260424182958.GB813908@ax162>
In-Reply-To: <20260424182958.GB813908@ax162>
From: John Stultz <jstultz@google.com>
Date: Mon, 27 Apr 2026 14:14:33 -0700
X-Gm-Features: AVHnY4IpkKzk_yrS4FO1I9AaTNTtETn5cHju-sbRY-SVL3Qb0QSTMLmzM959gxA
Message-ID: <CANDhNCoLnJEQnHUFogDxUa2d+QRzdoayCpg5mETt+_hu_OvFoQ@mail.gmail.com>
Subject: Re: [QUESTION] kernel/Kconfig.hz: outdated help texts?
To: Nathan Chancellor <nathan@kernel.org>
Cc: torvic9@mailbox.org, 
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "nsc@kernel.org" <nsc@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org, 
	Qais Yousef <qyousef@layalina.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 800EC47A8E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-12893-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jstultz@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

On Fri, Apr 24, 2026 at 11:30=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
> On Fri, Apr 24, 2026 at 10:18:44AM +0200, torvic9@mailbox.org wrote:
> > Hello,
> >
> > I noticed that the help text in kernel/Kconfig.hz has barely changed si=
nce
> > configurable frequency of the timer was introduced in 2005.
> >
> > Are these help texts still accurate 21 years later?
> >
> > We have e.g.:
> >
> >   "250 Hz is a good compromise choice allowing server performance
> >    while also showing good interactive responsiveness even
> >    on SMP and NUMA systems. If you are going to be using NTSC video
> >    or multimedia, select 300 Hz instead."
> >
> > Is that NTSC/PAL thing still relevant today, in times of high resolutio=
n timers,
> > modern graphics cards, Freesync and high-refresh 4K monitors with 144 H=
z?
> >

I believe the rationale there was just that the math for 60fps worked
better w/ HZ=3D300, as it gave you 5 ticks per frame rather than the
4.1666.. HZ=3D250 gives you.

hrtimers obviously makes this less critical, but it might be worth
some consideration as I know as framerates have gotten higher on
devices, using HZ=3D250 has been a pain point - as at 120fps, you only
8.333ms per frame and with HZ=3D250 the 4ms ticks doesn't give much time
(2.083 ticks) for cpu balancing to fix things if task wakeup placement
was not ideal.  That said HZ=3D300 doesn't really help much there, since
at 120fps you get 2.5 ticks, which is basically the same.

So for 60fps, I think HZ=3D300 might provide some benefit (which would
align with the Kconfig description), but I don't have any real world
numbers to show that at the moment.

thanks
-john

