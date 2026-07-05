Return-Path: <linux-kbuild+bounces-13938-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ldqfCfmcSmpPFAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13938-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Jul 2026 20:05:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B30A70AC5C
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Jul 2026 20:05:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ANoX993i;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13938-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13938-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42B7930080B8
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Jul 2026 18:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB783344DA4;
	Sun,  5 Jul 2026 18:05:40 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ECE3446A6
	for <linux-kbuild@vger.kernel.org>; Sun,  5 Jul 2026 18:05:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783274740; cv=pass; b=Bdx5TMWg3B+75ZbXDrVmcL/+d9QbdB4RCi2RZ3P7kPQD5l470gXR681tBGVxgB6x+mg/BpZTseY0fDEkoI65cH3uf+fgcqJ8ELx12z+Ue3iHuAKYvxk9+aTinSGPJC/zxc8UrgqamC+lBQoDrHdmmvpolOzmNNbtkgICtltRgs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783274740; c=relaxed/simple;
	bh=jq9TRorttzCZADcEBFzimD0zM8K9y0TwzNpsSFh7QT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3gYyGzoZqu6OdgszWXbCTcZJLZUxcSmQ33DHtWFO2rhil1AIu4J0H1FHGR56rVwDpszXXja4Qg7opof8+igozjBIdjReqcIA3MCV7A5go/paf3WgOlMPXG93RLjN9+sSePhXj+wt3EIW/rCwW+ofZSPEWnwpMY0HXduBKU1MYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANoX993i; arc=pass smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc7a269ca1so1813815ad.3
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Jul 2026 11:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783274739; cv=none;
        d=google.com; s=arc-20260327;
        b=mG7IZIaZzGxA97nhUUAXZJYIuuZsUbiiuOjfYjlmZguBMoSpLhd+XQH/fCiWEryjwL
         A2MDHtAcfCsr/KMmBjs6CxT4SRZgIMZlMPQYaK5VDrq3xzN5s3FLrMSXIPZ+ElO+XSu6
         kDJETK0ogB5Vhc6QO3ZbZUrgmnfMkP8BlYNnDijVhzQW6OPiAIAwRyOorPbRFMmvCfdc
         GGf/QIboghOLxOhgKK8A9RVJ4sDjp61t7SA9Ct7zHXdjjermypDJ9pnHJ0CjHev4sdef
         DB5wwqeWYEGA+QoK5bSTubHwx+HjhFNQySzvI53jin1MXzA/5z/W9fVHVxD7cIuE8Ohg
         z3Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jq9TRorttzCZADcEBFzimD0zM8K9y0TwzNpsSFh7QT8=;
        fh=D6S70HJ77fE6ys3uwslXiLbB/9mTZPYMN7K2B+iLOzg=;
        b=MozvXsn5Lf2JJqEi3X599eLKGANXVgFAufK4CHT6Q+6PjzVab7ej42KrcSiJ9sHsmw
         NtQQ+bkgFtLtNfXTpJAOgNbaqH4j1CcQ683D5Fijw06eYqFcC+DGei65gv4UGgMdDyvS
         fl0k6bBgtWGwMk/CcpNlq4PQWIgVfOgRdwExKz6iaT+yBUH0NFwzaTBbRkLNmSAi9l6a
         UY0cVkYzhNhQ8fS3FekGX16MvdH9DbmuHPT32JSe104s/l9MetjfFSRyhOtS8uiu7LD2
         mJm21FA3SWaTn+dh40Ivkr5t66liTmMeT4bQX0M3rZZI5JHKEa956tklOX0EAaT6Hjiz
         owCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783274739; x=1783879539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jq9TRorttzCZADcEBFzimD0zM8K9y0TwzNpsSFh7QT8=;
        b=ANoX993iN5Bw9Boi2Fbflfe1/TBZzYaSDNdbPcBkb7CY0TLfMVEkXO7J+iC7QQeXa2
         9GUMKBkIi8XUESirgwj1u6rZ/dsyMbLiEyEoQjm4uI5rcsyxCBcMdue7CchoZONClqwy
         0h0uNy/WwGNpkqdFniZ1ruWnJFhRTVI0blW5rX+6wNnWc/5VTOfpMLJSrgnCkXiM9sV2
         mZYiq03hHg12QwhzwcZ0RlYddzCM7ugvrTLCgOis1yK8WzmeG3V/kFkUdGzOCA6FQjwZ
         xENZHGiz83hRyz7U2ebe4GtdyJuc+GL3Mbh6iy03xRrdJmCi1LNJiJXlEH65gHwDmURE
         EeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783274739; x=1783879539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jq9TRorttzCZADcEBFzimD0zM8K9y0TwzNpsSFh7QT8=;
        b=jvjc5EIHX8AtbJeMrtn4gW+z8NYkFT24C2mW9pKt0F2S+qGE9GzMAQq1ikwbG+dbJ2
         3IImsK+X1EQ78QVrZBCySRTOfR2GHQEAr791iCurbKA7TRRB2//doHuzNDC4vFtxuzaq
         iqxTq+kU4fUUznpvPKQVVq781ihiHSJwebE+Z8Vb7SK4wGhErI8EzM7gU4VbzA6C9eyL
         Py+o/LkNl0NGnFbsuUYX0dtLUCrSyqbbYYxQgdAJ9eqL3GSWfQM4zZgwci/sYyERZc8X
         68erdqkjf6BHjUuePjcuxsL5nrUPy2ZlH9qx5bXUqjvize6YpeHQtFQZe9gu9pfL6SOq
         zOaw==
X-Forwarded-Encrypted: i=1; AHgh+RpIGQnWqXJ3fZ4deMi+mQJZnsb8AjQBKLO2HYFAQ7MqwTGVpcTzRNmQBCBQmBfruskzcPxsst+y1t2ap3o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2S3g4+ypV+tEHfBaNEspsftSvh1GD3cRXaOEyGXSA+kPXXkCt
	OeArQ7D9Cq5ssirUfHkav80IVhGC+hc5yq0CObZerbf5lVBBeFids+h5wVzWaeyXT+EDvmOnPPw
	jXPM+c8tjy1gZDM7qlg0PuvjAthm4e+/lDEEP7Ko=
X-Gm-Gg: AfdE7cn78kadHOWg5YcklmmBLA8oPY2pGHQ5VFtcZeZ8Dvzk0rrKcCAOP5q2bEBfuV8
	S/cEvh85GRwTY5IQmq75PmBn87qcF/+mxPOu2EYoFnEUMsUFXANgDHBlpPgM8pR8r2R+uit2gla
	Iey1eBleu5k41n6fvpaWvwQ6XQx6caOsTuntfTb6WANUL0AK7GZoKz8ik7gq62Jfve3aJUL67Zl
	HgPf8Zlu7n78dhFsb5iQysBpHmeLQIbO9n3JdBrRwLmF9hXCMW9R2wGFldokGxlpfTNTXC2tEAF
	w4Nh3dQipjP2RlI+JIGGUmmb5o8IHXNCCTEGxVwE9+DaoD5ocmrtZInM6jfKP5F9c9KI70x0GL0
	279LicMU2T9RO
X-Received: by 2002:a17:90a:e7c5:b0:36b:9323:c726 with SMTP id
 98e67ed59e1d1-38281d6e749mr4462314a91.4.1783274738743; Sun, 05 Jul 2026
 11:05:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705175936.4653-1-litvindev@gmail.com>
In-Reply-To: <20260705175936.4653-1-litvindev@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Jul 2026 20:05:25 +0200
X-Gm-Features: AVVi8CfW8czBZAbVgtBunA05HKx4DZMhyQptG7lgNqArj3IYRbN9fursU_DRyYU
Message-ID: <CANiq72kHbVQfNrum5D2a5sCd3mFQHNtigrQxP1WW=YcggxA=WQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/tags.sh: Prevent binary files appearing in cscope.files
To: Sergei Litvin <litvindev@gmail.com>
Cc: nsc@kernel.org, nathan@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:litvindev@gmail.com,m:nsc@kernel.org,m:nathan@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:ojeda@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-13938-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B30A70AC5C

On Sun, Jul 5, 2026 at 7:59=E2=80=AFPM Sergei Litvin <litvindev@gmail.com> =
wrote:
>
> PROBLEM

> SOLUTION

We don't typically use titles like these in commits. (Same for the other pa=
tch.)

> This causes `make cscope` command to generate a `cscope.files` file that
> contains *.rs files along with *.h, *.c, *.S

Missing Signed-off-by -- the one you wrote is below, in the part that
doesn't go into the commit, i.e. after the `---` line. (Same for the
other patch.)

Also consider using `-v2` in `git format-patch` to annotate which version i=
t is.

By the way, this sounds like it could be backported? i.e. perhaps we
want a Fixes: tag and Cc: stable@vger.kernel.org.

Thanks!

Cheers,
Miguel

