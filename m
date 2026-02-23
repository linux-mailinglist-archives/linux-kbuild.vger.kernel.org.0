Return-Path: <linux-kbuild+bounces-11374-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AwxAlrFnGnJKAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11374-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Feb 2026 22:23:38 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F15817D8CD
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Feb 2026 22:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F67430A3044
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Feb 2026 21:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB8D37881B;
	Mon, 23 Feb 2026 21:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="feZ35/6C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702C4374759
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Feb 2026 21:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771881566; cv=pass; b=n0AVWpcKnryTcSZbJ/9NFa2oHf4V1IzAk9Osyrf745cTFkiApbWNtuPUApRE0ueBUxu5kqTUrpLHoZsjFx302oNBmRyfrbe2DKeildjHPfwQSSFhilyXvg27VftDb/wPV/0otO3MIURzgSodpwAn4Qz26qC8WDT04NvUnMv8gO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771881566; c=relaxed/simple;
	bh=6xucJiKz6gf7cBFoHRvH8DDttfd7LVVX7JhNAoPFST4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f116bjfutsJTMCQTTo50+LcnPO1kSIpjiF9fDgH2kLbypqBVJwnqJxzgGuczP0LH7AQS8sh24LCL7vJK2CNWoD9WstbwbMlTcS/Q7+d47ASyeyjGD+ICPw2HyVtIWE6BUg5MnwvZ+4U3n2t7IKtOkRfL+mM/UN5l1t6X8bqf2tk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=feZ35/6C; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-794f701a3e6so45679857b3.2
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Feb 2026 13:19:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771881564; cv=none;
        d=google.com; s=arc-20240605;
        b=IHAfs8c5adHCqswqTuheaiyX031CvQ0T8tHQrSM57UNciyv4SP/dBEzBIKL6AHy8OP
         e/ErKWgYQwvuilsLMmp2h0XU5ib1wvFkLBC6z0M4od2Qq5PM+A02SwDCWwypgRVKGMgz
         WcszrWMThKY7sPGObl+fpNprZkkM3irK1if0GjxOSzJ9NzlSewuWj21NHGp921TXCmC/
         GMFt8o4sxxOJ+m1tBy8cDpPWFArAd8G1ipGgk6/2X8EFcUHcTe3EUYPMtN6vnHBsbCri
         yIBqlBc/qVbORgCD/HSSlqoH+3+gY8A71UcP9JqWwyuezZvXThs0DU7lehgs4oQZ4cb6
         kPPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6xucJiKz6gf7cBFoHRvH8DDttfd7LVVX7JhNAoPFST4=;
        fh=Hufwvr95IsCdMmtWWDp9PMBRTS+o0hsoqt31QPu9KXY=;
        b=Z2hXF+BavPl13NZh9OYYzI22zeozHAFktzuWp0oJZRQjJUjC/UUBR2dsqsOs1vAi0B
         TLYITktHj2ndqa4SRydNRoF+z7DmDOl0irCNYnWyL5OBUVLaNGheORwsUzv+zg+1Abfa
         +UxV02Hn29JJhnUqqdCdq9wwc3eh/VVKUPufuIlBXxr1Q2r0vq4V8poee2h38Mk+iHlr
         4rtI+O81ArtpY6V4GSdxxDjp2AzuhP+UE37EZ7pOR4cv2nh1UHyiz3FTVi7Yrb9TlisQ
         nSiQKa66+9WO4xWG0OhMoQRackSavj46BxmBfbRK2H03tUbP/sob0W8YF4yPGY7/FjMw
         ShiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771881564; x=1772486364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xucJiKz6gf7cBFoHRvH8DDttfd7LVVX7JhNAoPFST4=;
        b=feZ35/6CpLG18uFRD53yp54tfgbDQPSVpZKLlLIKJQL/7/Qb5cLP70jz8fUNFaGZeO
         XWlKM+VTx1EH8i5Klk0lEDjCr0xS4+o7patwo4c9uWXEk7HK6Yd+doLhe9DkMah8DhNY
         7616VXQL5mSRF1ss/milvO1prJ9dRSqPXAU1zbQvf9Z0gzJpcEx3uY89jN2hCX4IV64P
         UiYutixwkuYyCHCYO4EHuKuVSu7VGTmWqVMU2PbyFST1UzBU7as/KSye2MxwuMCVnCoY
         /iYzL41TlC1wlMsGr1lDemrC05094hsKbShHNnpUe376F5uPwjNFG5y5ThslNDTXQC2b
         Hoaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771881564; x=1772486364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6xucJiKz6gf7cBFoHRvH8DDttfd7LVVX7JhNAoPFST4=;
        b=uDpLxmhDqyDNNz8FrzEEXs+ciltiSAPeRD+p0jeY1KEVjWR4P5+H0F59Lz1uboyL8M
         TsGMmqNbGUb3nao+2mL2M4wQNraHtJYxm+EYO/5woCwPBjYgtLyfvl9p/MAYI+4T26S8
         0zhDT80VEXHUh2jhimc1q02sov5AA3AEkAo3AzwlgvTfYrsQTObqwbavtYBUMh95jIb+
         qSr+PKcVAu0nVS8aRvUJbPv/fUrcFXdyWwZ0fmDPznQmpf7FhEfzLvEBJ7xYQuOX04Sy
         N6P48MsDXso8NPz/AzL5aTVgSh3fxY/rY+mYNio18z/O4ZjrU5jfWayAfMVTb0zKdHtO
         5Azw==
X-Forwarded-Encrypted: i=1; AJvYcCUi3+4KsLEvwDVlJGx66+g//ElyJbHiXkXkZ7wKeGPcApcZ7kN4Vq0OuQlnlKTrkD7JxDNaznGYreyYALI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL8eA5g3Kzp+WvVZlSNzzNbDQ4SFjaRriZvltLFMKQ6v3yvMkW
	0xnFdtzI4OwuAznvWIhhhGFvt3udu8KEypw3QIwprLxwbVwL/dTNqzN7vhVDo0Q0kHttOS9DOV5
	VGvZxOMPThj+PqhF29WrX2dtag8Dli6Q=
X-Gm-Gg: ATEYQzze7hh2piM2GYbsl7dOJeGevhYi9g+tzySzgLETwh9qM8fIbdvjCvC9teHYWVw
	dvQc660J6Hwggck6s7Ia2KwbWhYirNSOo4iviAb+ZcXGY+l1qnwDkyV3JpMuqQOFSirMZUGUa4A
	b7b409t7XR6DQ3zC5017CVoDd85yvGTDqrTh2HMK6Ae8J/QEtE7fO6rRd9Ljs6Sk0LuCkRZF9Ei
	qam4wumYbfDV0/GdRvwNrqv6xHlhbhiNOYOVlif5wDZtHwquN1gQ6MDPYvQz31ItiDCzFc11bqV
	o0EiEv0=
X-Received: by 2002:a05:690c:298:b0:798:3be8:b724 with SMTP id
 00721157ae682-7983be8c0bdmr55059167b3.65.1771881564464; Mon, 23 Feb 2026
 13:19:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219210312.3468980-1-safinaskar@gmail.com>
 <20260219210312.3468980-3-safinaskar@gmail.com> <e67898f6-4e33-428b-8498-b8b28f817bd9@landley.net>
In-Reply-To: <e67898f6-4e33-428b-8498-b8b28f817bd9@landley.net>
From: Askar Safin <safinaskar@gmail.com>
Date: Tue, 24 Feb 2026 00:18:48 +0300
X-Gm-Features: AaiRm50sLaC9UJuN7QdRgNE3QNOZiS7DWDKIfXjMKeU4af4U1Sw57WjY7CysLU8
Message-ID: <CAPnZJGDDFrOObdxa70nSS0bqXQ0zqRPnKWLRFUBCj-FtnkpPtg@mail.gmail.com>
Subject: Re: [PATCH 2/2] init: ensure that /dev/null is (nearly) always
 available in initramfs
To: Rob Landley <rob@landley.net>
Cc: linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, initramfs@vger.kernel.org, 
	David Disseldorp <ddiss@suse.de>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11374-lists,linux-kbuild=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[safinaskar@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[landley.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5F15817D8CD
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 4:15=E2=80=AFAM Rob Landley <rob@landley.net> wrote=
:
> Are you saying it's reoccurred, or that you plan to run a 5 year old
> userspace with a current kernel?

I was not aware about this. Okay, I agree that /dev/null is not needed.

> (Although I can't say I've regression tested an init task statically
> linked against bionic launching itself in an empty chroot recently
> either.

I tested current Android NDK LTS. I found that if stdin/stdout/stderr
already opened, then bionic binary will not crash if /dev/null is absent.
It will not crash even if PID is not 1 (so chroot should work).
But I didn't test what happens if stdin/stdout/stderr are closed.
So, assuming you already somehow got /dev/console, then
/dev/null is not needed.

According to code, bionic binary should work even if stdin/stdout/stderr ar=
e
closed, assuming that PID is 1.

--
Askar Safin

