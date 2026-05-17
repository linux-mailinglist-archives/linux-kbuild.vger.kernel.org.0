Return-Path: <linux-kbuild+bounces-13196-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFQfLd2KCWpXewQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13196-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 11:31:09 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6320C560435
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 11:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23DBF300C905
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 09:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C168346AC2;
	Sun, 17 May 2026 09:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCtUKLnb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537C530C167
	for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2026 09:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779010263; cv=pass; b=f1DFhL8fG268IZd12ny4IS8cfbMFl0BPZSbSwNirGo5NviqNAtyQz5sNmlcodIBCnGYX/7NpZEWvCBEQfKJWFmhQP1HilHmHaY7kkP9h/NbTQ/tpbyG8z0OwZZ1ByM6KF2Mae+a8hBxNtAsg9hEJpVtdmTSz7v8KpSchelokOnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779010263; c=relaxed/simple;
	bh=Tj8PMwAalAJ+NmdWjfw4/5fdDmXngxe4fWcsgfJA14M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nyspe+C51fPZwXvFhGiPp5H6tt+uaZ87CBX82JqDlqLmrAKXdagZEzNZNfHWgEWChjaM/XpIwgnBs7txkx0nDaqZTjWXR2Jni0dFTJVjR5tXzFLdLGTeFwyox/Q6SWcNpSDcNzKIKqeyCU4+7mUPhSAat3asMOsIFlJtn3HDnXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCtUKLnb; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f13ae64db1so41661eec.3
        for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2026 02:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779010261; cv=none;
        d=google.com; s=arc-20240605;
        b=GOCcNzMcwiPCCaEBKECduahjsjs+8YPeYPg7F+YFfreObKtOirbnWc5vHaRP1EOnv2
         bMJ/YKMTQ/9KAz5u/ysmbE7TiQ+nhS8bilhG8a0CBFuNxCjwq/5Qs3WuRLjqbwU6g1Bn
         vHiZff/Gv8Q9gb/fD9ffs7SDUtljQr0vb+LEhx53fIrRf3hRVUj2ZQALg3a126klsDUe
         bpQZV/BtqcAJuvBvhDoN1JmxHMSeE8RFVXtM1F2hoHAJo+fCNkuFeDzAi70Paoe7q9zf
         PJNj6LCy1IChAQtSIKjJTfPfOgzXVWJl0IAyA3RfVe45lOKD1S+3dfk+YXA6K1yY/rMv
         BC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tj8PMwAalAJ+NmdWjfw4/5fdDmXngxe4fWcsgfJA14M=;
        fh=QnFxsuSjlycnq8hB/gQA+xVheFYXNIn0lFxeOweruTs=;
        b=GGjo+pWW4+C8FnFCwtSFfwpFCFlkVNyQlbsfVK5Vr6CMAcCKWO5kSZ/Tf7Yg2ioW5R
         ezZw1Z+G2PcZEwsAE4cWjmvxiSVjjcjPghDCa0vXXLVi1vbXuAQ+RkfgH+38QMvjgwm7
         OMvT1Vr/vtgNJpnDxWF8RF+wIpZ7v6IlTICNkbmVx0/TalRp6rWyc/gs94dUfrF22cPV
         +UyYD5JvldUOcRtl+15NPRYw316+Ee+ZY7icQEcOT130wmypOZ0ZiuVLcfrnOzmVPzNX
         zfi3Cac5LmJMwI02ykQuQSmjHIBs5MB5x3ubYPuJeUTK7ECnpC/Nb82wL8/ACPeownHG
         6zDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779010261; x=1779615061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tj8PMwAalAJ+NmdWjfw4/5fdDmXngxe4fWcsgfJA14M=;
        b=cCtUKLnbQwjHOBQmbvQgYF1WfDMRn9Y/5xHPQqn24MmyIJd593XJyCFQENtQL1IXbQ
         92xmA/PBzRKbaMzncdonmYc2jfJfAifZVN5jqMQcQsdIJNIHnqoo9fYmDPRWOB+5G8TF
         v+VSiuhW/mOXn5lXdKTWRThQt7T7tfKXQQgQcuqFbh3kdSJjCL6hw5N0mDdB98sheB/r
         yLhkUypmLWotpUn+Y/AlLUNP6/p/7s6oNj9L6zgWcREVrbhTV1nFpnvg+W4FkY0FpzbD
         mxiAUtIDqh71jm7I96kAbpSi8e9Msx6h2RaRyirRWOuR54PEXYWAVPl0UEx+7J2YLvgJ
         d2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779010261; x=1779615061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tj8PMwAalAJ+NmdWjfw4/5fdDmXngxe4fWcsgfJA14M=;
        b=BDHnDDqlrjf5XI5nYQaU3kFSUnA+pFJDTJOaHUfft6hS3N+62K+DxRu2IxJzo/DCc7
         ZNEhCziOYCYdvjIbMESC4LJuFC1+ZFqDBqmiThaJsjbx8UL0YJ2+nSQr5B/f6L21ph2e
         cTvzWE5+urFv2Ar2Idy8mY9MtCrCbvcDVY4oiNqO7kC9uJbCpPmjyzv3Sp3D+5v+0PNU
         AFNqRl6DLFfwycA13fgYQxZG7OFMx4RAnCs+oj7/tqVVF+JWa7XQMQ1RV/q/w/mqYBsF
         9ogCgkbAHJ0+MERs+Wv6KL8sENmZYFNksOdhn0IpVcAkU/XGojkmTwTmpCpMmBq9gB01
         A/MA==
X-Forwarded-Encrypted: i=1; AFNElJ+RL1UyQFIjDK0+T1Rn+7S8Tf4y2EAtAIVrPURMc5oTmF/EtxgjZymotr8A3A08UfK9XausHje0NGqSXl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAw2ZlojbP2oL5ZbTijN7es3f73TXgYnX4mvmhXkbGwNy3W5uK
	BG96G160HrWVuLE0QuzMuXSW5/S/Zdjjis0+3E+zrR0th9CH+Q1FC1t559s3XtysikUsFUCdOwx
	CNRjxzSBFuaI+GPfwgch75LmATjx1x7Y=
X-Gm-Gg: Acq92OE2FrWsDTK06LqNM4jIHN10ZlbuaNVA+0YnS2K3YZ3hROcjHPhHo34x+QLnNgo
	N81wAhylkvobOsGl5AfCRs2XhX1Vur/Rjp2NWN84OXseimsdS59R6lGOwCSErATQloEcPQZGMt6
	vRYBXlXmZnh+zLCt7eBAsF2KoscEGgw7H7vcmxmT5pddaSObIc4p6eSUxbybuHelgjMPBZpgEhp
	fF2vEcCe+HKiQdvdMgwcdbl3dm/22XENk94mg0/rEdP6+apoYJNhKbHmX8obbH+GL6qLbH7PBc6
	1kM5oMMZgavNfdbKrBzWgotWIowrUQe3k8CiHcrbaD/BG9bJDQBeFquY1OWDtBND1A5Gf8gqZZ6
	woNtBC+xzh8h0mTBevvGWGHC2GdcICoGOJw==
X-Received: by 2002:a05:7300:c89:b0:2c6:7f49:a840 with SMTP id
 5a478bee46e88-303984e931cmr2228415eec.1.1779010261233; Sun, 17 May 2026
 02:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-2-julianbraha@gmail.com> <CANiq72kr=tzvEitYj6xyT=jGnKQZK1dmekSU3us7MWGTrv0FNA@mail.gmail.com>
 <615113d6-7e90-4d54-ad1f-a6833474e8c9@gmail.com>
In-Reply-To: <615113d6-7e90-4d54-ad1f-a6833474e8c9@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 May 2026 11:30:48 +0200
X-Gm-Features: AVHnY4LeUOW2UmbbdfLrnREDBNSldtrnck-nHpAbjlAYEl4rANYC3G7F97ZBSWA
Message-ID: <CANiq72=9nxRgfFf1WzWgp=TP9or=Mi=wLyME9-f2M4hti+ZNcg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org, 
	jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net, 
	ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	qingfang.deng@linux.dev, yann.prono@telecomnancy.net, ej@inai.de, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6320C560435
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13196-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,linux-foundation.org,garyguo.net,arndb.de,linuxfoundation.org,lwn.net,linux.dev,telecomnancy.net,inai.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 9:32=E2=80=AFAM Demi Marie Obenour
<demiobenour@gmail.com> wrote:
>
> Using a ton of vendored dependencies would make for unreviewable
> patches.

I am referring to `cargo vendor` here, not to copying in-tree -- we
already discussed that in previous versions.

Please note that I was arguing for avoiding actual vendoring in
previous versions...

> I'm the one who suggested using FFI here and for command-line parsing.
> The command-line interface would also work.

Yes, I suggested the CLI in v1, and then you mentioned the library in v2.

Cheers,
Miguel

