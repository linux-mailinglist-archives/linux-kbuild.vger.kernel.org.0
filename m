Return-Path: <linux-kbuild+bounces-13098-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OK8CKr1UAGp5GQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13098-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 May 2026 11:49:49 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CD65036F6
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 May 2026 11:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ADEAC3002B09
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 May 2026 09:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C7535B65D;
	Sun, 10 May 2026 09:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeTCXj1q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C499F34405B
	for <linux-kbuild@vger.kernel.org>; Sun, 10 May 2026 09:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406587; cv=pass; b=RRLoZRS6FjEzJaRGnDJiE1rUbP/X1gG+DLtAml2lfLidik5POGQmwjdYREFyjLkgwy8YgFac+ge+S4n5+foKKY4opy3rdcdqCR/ixnV+cbi0hhBtUUzWJ96FXEBLQNB//mNPHZhl17QOUMAqyhbJm7PnGBDIVR98TRRLfvi71IY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406587; c=relaxed/simple;
	bh=lJQniN39MziSusnrSeOllIKVtVemIJd3P4RXjYACezk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/FLEwV2TIvUAMFS2+mClo+hXgM+jbwpodpg+9Jm+AhkuoNSRjKjD2le13EgHIB0xU8G0322bhABB4SNXcCEsHVvpv7ovozgrTi3JQWRQ5PY8Y4l557JhvloT3FHIqIYb1/jMH8EwtVmt5f4AcTM3M5OBfFx+P7bYGTQ5C6TXsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeTCXj1q; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2f114d129c0so222599eec.0
        for <linux-kbuild@vger.kernel.org>; Sun, 10 May 2026 02:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778406585; cv=none;
        d=google.com; s=arc-20240605;
        b=kGQJIwn9efth2hSumsmKOAypE4RWHKfgqdY2AX1S+Sc3hYmxcXTL0Yzw7CNh0F+GVZ
         qCkw1uWerRLiQSk4ayVNi6HSxtt/Yy82VzW+rTYwR3TEWCmMOfJR0grHNbSXDRWSZtM+
         3EvkvZv49PBSVCVWIu51Zf2M80ymE4UOn9rG6lHLOx62kmNkLJ8gw5qm76009cSeJB9x
         820jg1CyZ7giJAvVYQhwo0GPqNxefYd8T61xhnDK8//f3++Qp9ZoRCYsXjpsm/CrjHo/
         PUg4rvs+oSfNSULjhHHzWOF8hovZnuRL51GL5WHkulEL5IQbns7z8GArgeWDI9vCd9L+
         QUWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wLMtKHMfQwC2uO82mpxETiCYDm/FHV+08XCpd9Sqn5E=;
        fh=Pct4pZU2GD3CUNTr5nQkUlbg8dFZp6X6CO4j23xwvpA=;
        b=P8qMAgOnEl8Dhw9EGcWdz6m4+l9IK53Qx/gpeSqq+aMqgBvG4YJsKHwQyilS6XxTqb
         Yp2qls1nz1p59x8W4FBcPMnt9Rb1QYKJRwi8mNXUVMFAo8/DuSa3c/z9KbOT5hRA+Ovl
         aGlpznJaf2Slh9bR+pJATNQ/xyRwKh0ajF88qlN1q9p9OpTxhNrP4VkebHn+rcTujveP
         RL9ztY4Wg/u/zshp3BWEQWujuuda4gMuW0MA6MPk4SumoUJXn6VFNE7AHt8R8CIi/rLi
         xDEEzreqcnIsTsLDbhUXZAOTzVHimtREgjTDXHr7uDF6ISxoZcMFgqSj2zua39IHeCBi
         oJxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406585; x=1779011385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLMtKHMfQwC2uO82mpxETiCYDm/FHV+08XCpd9Sqn5E=;
        b=VeTCXj1qlRbFO7LmPcLoVI6ldZazYNphicwv/BaQTE+GH4MthQqUhTXxpYgP4YTK1J
         AZWyB6uG2zSytTYmqje/1AgdRy5DeAHtkKeT1BbwxE6YtE4fZInYkGakV8JsqEqHEDRo
         TXVCM46Iu4kuCoUhTQs3bfdgpnlJ3MB4eCgxJR5ce4a6xd7VE6U1u+/0XBQYxP4uuktF
         M6G7aJtkFSXSLdQ+nVAB2PtQD74ZuuG9SB//j3yPxIVrJFvDwxb8QRJ3HMUlH9vV0Sev
         4gi1BQtiaqawpx0jS1vjZGypefUn2OI9ZXL4abVGCHTYRk8RVTIM9AEwDO5agwlIvygn
         i9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406585; x=1779011385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wLMtKHMfQwC2uO82mpxETiCYDm/FHV+08XCpd9Sqn5E=;
        b=nL1VTFrRjFW3l7THyjvbYPwgex48HPzGaLgVX4i8W3xXAdOEI0zbdtum1cRr47Rktl
         duaxufH4a+5JqhxL6v+59LCBMN6xYZ8wN8anIz9JMCQV8//jCiVTzQx5JwXfQdk9vIS5
         fGR9p8vDwNyndC6tngdzLpIDedS+/uD2LuK2SzuFzQmAlCytY4yFAHSYR+XSBKSJylXF
         DeBMvVywvkgMWnF4SFIPnMnO5GpbLjld+N5M3g004PqEUrynHZiwe+Pwtva1kFAZal42
         +cu4qCf8t88PWfm3SYL21KQCtkXhWXN7HB1Laen8UZs+tHqmTrpjg/HvHLHSkr7soYHa
         RsPg==
X-Forwarded-Encrypted: i=1; AFNElJ/UbFy/528KsijfezKUf2Vg51VfiEybq02t0tkX0OCnuvw6+c6i6M5ik0vSJuN2DECUtSbpaPzrK2bkXLM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywufr/RmeRadAnw9LCvJbMtZ65rTFfjLLVVX/5JgRNlYUW1AHnC
	7kso2OeKbcgno8cpVg6Fvi8x7w1RF4o+JVxRKBsI+f/FMKuF/fuBGtm6WHz2DphQ2ZIUS9Me27+
	aMAgMu38BaKJgMbDg7U9qoiwMkxpHbC0=
X-Gm-Gg: Acq92OGdqff++qK2F6a92vZVr+T/XMHJc+VxWp8j4x2TtRso0ugzHYj917SeXaaQHro
	u5/2JtK6Pp9LuUaclmHQ89/o+zqn775L4Otag+XBFQ8RLK7Qmdew3h6p+U7LmGaqFYc56dB5n3I
	5NJWJKMCvzce3YI2FHefHqfttmzuhlkKDODGWE1Bzs0TucwrSYXgvoyXExXEuIBS8h6u7lUhvg5
	5Xk4dM03cS3uMOC5cSuCEk8I0aVC1sMfhD1QqiYXWQMd8gvbDqc925Y8qANwpBXkk78gWLWP3Yb
	QMSIpv9jphPU8/9R6sI2lRlH81GNlfW1iM/5wLDiOrYwfxyaAzwHmfPVBD8+wYe42Mvz6/BXLvP
	ExckxCmG5SGKOafF3oZMQDOHqN9msZc4kjTueoQlJXKk+
X-Received: by 2002:a05:7300:d511:b0:2ea:de28:f389 with SMTP id
 5a478bee46e88-2f59fed19famr3955753eec.8.1778406584746; Sun, 10 May 2026
 02:49:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509203808.1142311-1-julianbraha@gmail.com> <q02rn6o5-5pr6-1744-6os9-1052roro79s8@vanv.qr>
In-Reply-To: <q02rn6o5-5pr6-1744-6os9-1052roro79s8@vanv.qr>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 10 May 2026 11:49:31 +0200
X-Gm-Features: AVHnY4ISEl_kLYwIQZ64WmR4duBVOb0clDciE4kHT74zzm-QAgeyD8jr_6WPd14
Message-ID: <CANiq72kUD=s7VkOUBNFLbcASvDoO_qFXHziOcSFdDqtg5NXoUw@mail.gmail.com>
Subject: Re: [RFC v2 0/2] add kconfirm
To: Jan Engelhardt <ej@inai.de>
Cc: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org, 
	jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net, 
	ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	qingfang.deng@linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 48CD65036F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13098-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,linux-foundation.org,garyguo.net,arndb.de,linuxfoundation.org,lwn.net,linux.dev,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,inai.de:email]
X-Rspamd-Action: no action

On Sun, May 10, 2026 at 7:06=E2=80=AFAM Jan Engelhardt <ej@inai.de> wrote:
>
> Good lord, how is anyone supposed to review that amount =E2=80=93
> or is it just getting rubberstamped anyway?

Yeah, if one really wants to statically vendor the files, then please
follow the pattern we used for other vendoring: see the commits that
introduced e.g. `rust/syn/`.

In particular, we try to cut down there the dependencies and the files
within each dependency to those that are actually needed: no need to
support vendor optional dependencies that aren't used (and if they are
used, please try to see if they could be avoided), no need to support
all platforms (e.g. why do we need FreeBSD files here?), no need to
vendor the tests nor scripts, and so on.

For instance, for `syn`, I modified it (minimally) to cut down one
dependency. I also provided a script in the commit message to verify
the files are 1:1 identical to the ones upstream (before adapting them
with SPDX identifiers etc.).

So, from a quick look, here I see files like:

  scripts/kconfirm/vendor/vcpkg/test-data/normalized/installed/x86-windows/=
bin/freetype.dll

Which I would be surprised if they are needed.

In any case, when we discussed offline building in v1, that did not
necessarily mean vendoring every dependency manually into the tree,
but rather let the user set up the dependencies before (i.e.
connecting is fine) so that then the actual `make` steps can proceed
offline. For instance, using `cargo vendor`:

  https://doc.rust-lang.org/cargo/commands/cargo-vendor.html

In other words, one should be able to have users run a command or
similar, and then use the dependencies that are already downloaded.

By the way, another option for that may be using the distribution's
registry (e.g. Debian and Fedora provide one through the package
manager). That is even better (and we were requested to look into it
back then for `syn`), but it does introduce complications even if one
assumes Cargo is available (which we don't so far in the normal build
path), e.g. the versions need to fit, one still needs to provide a way
to do it for distributions that do not match, etc.

I hope that helps!

Cheers,
Miguel

