Return-Path: <linux-kbuild+bounces-11372-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIH8N7m/nGlSKAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11372-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Feb 2026 21:59:37 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F72E17D4C2
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Feb 2026 21:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26653301CD82
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Feb 2026 20:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782D8378802;
	Mon, 23 Feb 2026 20:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eV+1GIg6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43460377548
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Feb 2026 20:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771880375; cv=pass; b=oMaN/x0tB5LZi4Vq8JhSv1qVk4VhyrvodH4RWTgga0y8Fpil6+/1+HyeCuoZgcCCIT6yeBfdXwKDMVTMujp/s6aPwFbc44Ep/UjrR850djiTmLixAi13dt8hTUaZjPJakkbTrViXI+TH5wf5AeEGhWzPLGIsDMGbvYZptEA1HJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771880375; c=relaxed/simple;
	bh=ZGWxl/dhdATLUFkTP4bDg4Eh/JPLgT7DDIEuEfXiY7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4hhF/3RfhdNWQyAN9EzFyIDyf5UgSCy4/VyMHxIwFmIvH2Y2xRoz3jaiDGDCKAnUDLWzvE1ZDPA8HRGedSF7Rlv+CaewQes216KNu3RmdXn5mkUGz6sWyjTn6zTXrTMGrBeINppsJ8aYbpUt7cz2AVEDdLjISnoy8P+VIg2HH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eV+1GIg6; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-649df393c04so4141075d50.1
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Feb 2026 12:59:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771880373; cv=none;
        d=google.com; s=arc-20240605;
        b=cnuEYVYwC2ecyVuLIXMkZg3eUrWcsyDzvBaRpZWJvOrR5IgJmRV5MwWLlSjcmkHB9b
         V9fq95pwhEtxX9RYPf+WYVICcQNuVAPAbZnCFevPJaHzQvCPpe5a8oNv5LsjMGJbVQ2E
         xSkvkAGiv+8HsN3rDZLpN+j+vq1qTga/isKpAhZFugRnWosDA54sBaVhA5/ajrnHDjvj
         uVEKvGy2BqzM9cskUfXp7alNgRy49u7aPdbgwNxE6EREgXP62WVLEWmrU3RIxdAYx4J1
         J1aalLur725+dNTf1UdJLQo38yzZ2CIva/1XsRyq6duOK/p1TNhSmhJcOJtElttORaWB
         8RzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZGWxl/dhdATLUFkTP4bDg4Eh/JPLgT7DDIEuEfXiY7U=;
        fh=lv/LKikGplAzYrqWDgUkBUFCr116Dusqn7tBYF3k8GU=;
        b=eQ0pGezGJUVH0SIfvk2+F9qR355cCfqi1O/BCrWL80Sl3/j/ch00QY19Will/Atryg
         6vFJIPanLa4lMZ+UVX8m7Ukde2782HGzvpKJ7QZ6lP2raW/leeeGAI73awhnQQfXTcsa
         +WL+4igHYDVzK06sokqZevrrz1zuBrj8cMZg6Ep9uB8n1xwTpeGALvPiaUqx05NAPFPu
         DO329WFZ/RHGYk2Y6MbdQdQ6DgROpWyklrXDUV2VpzEEq7WaN0Yf5QWTns4ltd9QP8Qw
         SKpgIyN0aBs2bhKm1pJe2hnve/bsCbHQYmM3TgQBQdC7dGT8Jka3PcauFsduxnecjOF5
         5Q6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771880373; x=1772485173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGWxl/dhdATLUFkTP4bDg4Eh/JPLgT7DDIEuEfXiY7U=;
        b=eV+1GIg6+1Ij6dfRAkcvpGR/q8GlRjkqQCIlV+t1NLWRdwYCLtLMNWZecHBdU91rFh
         w/iD6Gfhxx7S3i8FVR6Z2rWoctuQVejqEYLaSbEdMcWr4Hy8N78bLgttQlrTwneVi+EL
         dwHq1GNVqnsk+cOcbRlbpbY3Rm5LouK9CxnIkF4f/1F+orR93pNmz7wh9uDscIxyNIHV
         yAc+34cNpXTa7UlpTfxBGHiuAXn34ZbbV+NS1WuwXItiSzeDY8gSg5wU7db0gTGrIXYD
         U11fCL+vdnRqQHTZXkz2jsI+TwoWcvzg3ZHapdMrMxjL0xwbJ61gDPS5FArIUhAzQQeJ
         G3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771880373; x=1772485173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZGWxl/dhdATLUFkTP4bDg4Eh/JPLgT7DDIEuEfXiY7U=;
        b=UQaP5zY7HR3j4hevtnWrS5ivwlQlRo0b/hXB9DGxOcftB9ljYe1sYX6fvZTozy9ELv
         fFHbra7umeyLSPOudAxsa0r4NJNGlx94hjWFzjiHAl0wN7NPSV7VysnzoBYQdy4PKIdj
         2uERT1D1vMmdOZOW9DVxnW7BNG8Yu8DFdzXVvAy/xX4EHMsXRcT3i5pXFuqF49JbakfO
         BGDky61nalf/acQZ/H4l+rllNlyzdVFNg4ELLMV72BIk5+oSmDmlPTIhhOgYdh4TRQtc
         coGX3gvvBSDXWYGN1oE+6A2WU2GgFdYuvdk5SkPm++mDJc1Gi8EczmfoR7AUwSifJbhR
         1j6A==
X-Forwarded-Encrypted: i=1; AJvYcCVDHPO7lF0pnfMPdveyciW1XSXOeh4DP9tXLTqTQEFfAy956PGTdvXYuUAOVe+3YzdDlc3v9A7nfRtawpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV3N9zx9DL3BhrBS6l0GKBXlUVL1jDe1k1T3WLTb2RIEbBVpM3
	e8Wo+/R8EYB/JOGHlTB0YhzhkoVut8fYk+8geNLIn1yR2/iw5VSkECCkMt/fmHJU+N0CYNUiBoB
	3OZi0As9bWezeu4w4dvE3c5shcHKSck8=
X-Gm-Gg: ATEYQzxBK0foLRj8vvdp6MVHUO5lj6kblII2X0A1RcpsdLqll5zzNyTwnJFSkbFZEpK
	y+pEKN+muFFd2fhml0Q/V/ErshucMOC0QLqSZbX3585EZ5ldlnDMdodzDEhT/LRDA+uTHdOviuE
	dofofTf6CIB4yVFw5V0U0Rk78zf19juG3pNAQsf+s/tKQZ4ZM/tr/W1vwNOGoeNyXVXiwKzJ8FL
	Wf+3Ge2zydH4W14ohCB7cZnr0uWvjyX1W35hZJCuM3PaDPSQZFS64fklIIxwqHVXaSA24sezgr2
	jo+RG5I=
X-Received: by 2002:a05:690e:d47:b0:64a:e799:1d84 with SMTP id
 956f58d0204a3-64c78e3ed37mr10186762d50.49.1771880373230; Mon, 23 Feb 2026
 12:59:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219210312.3468980-1-safinaskar@gmail.com> <a7cb199d-928d-4158-8f16-db7ae5309082@landley.net>
In-Reply-To: <a7cb199d-928d-4158-8f16-db7ae5309082@landley.net>
From: Askar Safin <safinaskar@gmail.com>
Date: Mon, 23 Feb 2026 23:58:57 +0300
X-Gm-Features: AaiRm52qRcNRr0w0juOjbrF6MNkTC6Cm6dik1IbLPWbMt5sbBgSggwUmnjLgJPQ
Message-ID: <CAPnZJGAw9o8BetWs_wO2B6YD7mYuOopP0CwD=KCfOJXw2QU4Gg@mail.gmail.com>
Subject: Re: [PATCH 0/2] init: ensure that /dev/console and /dev/null are
 (nearly) always available in initramfs
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11372-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,landley.net:url,landley.net:email]
X-Rspamd-Queue-Id: 5F72E17D4C2
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 3:17=E2=80=AFAM Rob Landley <rob@landley.net> wrote=
:
> FYI I've been using (and occasionally posting) variants of
> https://landley.net/bin/mkroot/0.8.13/linux-patches/0003-Wire-up-CONFIG_D=
EVTMPFS_MOUNT-to-initramfs.patch
> since 2017.

drivers/base/Kconfig says on CONFIG_DEVTMPFS_MOUNT:
> This option does not affect initramfs based booting

So CONFIG_DEVTMPFS_MOUNT works as documented.

(But I am not against your CONFIG_DEVTMPFS_MOUNT approach
if it helps you fix your problem.)

--
Askar Safin

