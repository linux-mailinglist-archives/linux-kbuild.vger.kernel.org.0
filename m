Return-Path: <linux-kbuild+bounces-12142-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDF2Mwi4wGmpKQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12142-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 04:48:24 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B562EC43A
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 04:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BBF5300A8E9
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 03:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF4F299948;
	Mon, 23 Mar 2026 03:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRKnIKUq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F6E1D9663
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 03:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774237700; cv=pass; b=JhCEZ5XKhpP4yTbyQvXmiORMy9znlYuIjltwe1WbqKaoVVjNRc+gVLJ0haR0RwwoXdnMNiMdWO7jxKVUz75ljLlDo2BCC/8Oi1BY8iGfmrlZ8Rdnj5wp7rKnyOWXIQye0pNvpfVjmccifCsc3myYG5LwvMpaYqtRHm1ndLJFZCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774237700; c=relaxed/simple;
	bh=Q0mI2TwYycM5sgLrcd1zuOS4TrakRSO20fAXPQ2Ywts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rTM3QRj4iX+Ygktz5QpBskvDLrJoTZFZl5jo/6Gg76lnM/MOnF5a5DMG5g7bWfkslUfQ6VaEJVLWz5xmkIQJlTY7sH4fzpEVM5w3n+kKxDE4KeDzonmTHJgonq8g5YPGOQSJuFFF3djH8uY6LNFXMed9KvrokQBObMFYYwfkxNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRKnIKUq; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64c9a6d7f81so1995159d50.3
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Mar 2026 20:48:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774237698; cv=none;
        d=google.com; s=arc-20240605;
        b=VkLg2aGVFjU0gnKRcVHThNzAGdXcynVMZ1XXRjW0eA7s6t5epuSVzoMOVwMwS3SVny
         xMg+GUyK1LvQgyiY044sG34PEjDJEubpCmA6WT+WIKXREPRKV4W/HsMxqeK9BWxD8akd
         lgedbJisW/gn2/XkPJe7Yyr9CyogEsFMON6lWvFmPr0U3tJpKmehVSNAr9WoArT6Fzss
         KpM3XMvnMx0vU+MNJLsBvvsLtwtGkAcfAW1SAJr2ebirg3SazVJjAXaTgPCo6v62kj6p
         9Nqu6J7rpIh8jIqDwaxc7EBRf4n3MSFRucE5fQG6ZuZj7woNh95IJZkxSSOb8u0YHCE4
         yXbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q0mI2TwYycM5sgLrcd1zuOS4TrakRSO20fAXPQ2Ywts=;
        fh=1wpteKu+1Jdcug7vlU6DxzI1BzSee74hgAxyg0AOZj4=;
        b=V5Xm3DAYjpLrJVVF8ak/JcfI1rYG1S2pzUPqN10Y7ZibFm89AO1rS8M0qRzNN71RIb
         shd2wqjKV3Ph+pJRAlb1jkjUoyGiwA+qZl3s0gBkp0LyVAADHgFp353EXKU/Htr+4kkb
         JgpwEufFMcr0spSY5NW3ziKCKqAEYGXkc4l0DYJ10GfpBbWd0RmRp4W+hPfiHGwGnE9o
         zQfw5zXMN4pOikHFMSOg4ZQGnAJm+9TFAk8jIdo7ZrnaZONo8tF9JGuZGT4OUEupG/oI
         ziRbpwOuX7kvVSWzxxh3drIawltSY1TgXClY2uWkfW9+pnWFyyj9ygS+l8mN70IWuI1N
         KKzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774237698; x=1774842498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0mI2TwYycM5sgLrcd1zuOS4TrakRSO20fAXPQ2Ywts=;
        b=ZRKnIKUqHlbu9S4/u3j72jUfqdIoL18PVg5Gmli8BuuuKRm2xQKLnConJjZ1oFlk3Y
         xGs1kNsepaYHj5wv7m0TsRAyRPGrVz9SGMLsB+Lj5tYpR4yjT2LdeJNcNOhJlMmyR1Kj
         Po0s5IilZHVTbFvR0vgnUUDHbbDcEK6I7yZPXW1kpSe313JkD34rhMbCgTSCrACZbzSp
         eIjNLhNUsvr8vNQ6JVbOJoBuymfDGbIOT0W26KE1nbWwwVwvH8L0X8/dZvbpsNqI10A2
         tgJESBzL5i5r/iwAyvU5VlDcNlu16pshZV4YgDeSfA8KGNv3Pn3OY8q+Mw2OYX+9WDac
         YNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774237698; x=1774842498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q0mI2TwYycM5sgLrcd1zuOS4TrakRSO20fAXPQ2Ywts=;
        b=qCu12hpe+8Rw6uLry6SUuxdIWVFXwwhIKLCv/3vikZeDtJcZq67NJfG7qJeCFuYofB
         pShlllG+3wuNTIij9bekdpsFBtXDfwMMpLycYHbmmwOh//JyCyTO+9WCqLx75FUpLrr4
         86oLTuy2ryy0ZSgSsIWcVGzgTEwbFAxeSCtvdSqThQwqNOTsEjp3lEWs2QRwxKL1IkuF
         DSjwic/WFCe2nYcJUfFR88vg59LzlXI5SJ1DQ5fFbyom6Ud/e/BWn5NPoMoywTY0NEQs
         ANnsglNRwxJBRGmhZ6QjV2shhdFSD5hjIexIoEUG4rq7pN09rSaoSmO3psNGLYyJSQ4E
         z7zg==
X-Forwarded-Encrypted: i=1; AJvYcCWiUuutiZ0b6kkbKfh3yeBaYWVXm/B8xwWz+bJj9hl+mDmldML0vzjdJ2PinIRMo5emwXwzCNqzotpkeoY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4242Rcfn3oU1m/V44CVDm6JGpx6dGbca67DlVhG/EkHwFz6DL
	OEpVgKK0dWGggln0M8kcGdnFeZqiCubRi8CSkKBhMALE+0IuX8MhueiiwJTXI/tv38Cj2Ls8uqx
	4UkjzDf69BhAVldf1dFF5d0GDW9Z3Oak=
X-Gm-Gg: ATEYQzzGtW0R3h19rRYpHuflnhFj5Xp2sm2V6k9jun8OPsUE0l0wirmupxSnvugv06n
	Q4B0iVoqC5spWTe6M6TD77vFsMhTleQ8wlhdC9B3dEuFbbC2qK5fUWVOXbc39ikNowOI2jwA3ui
	RXyagdi/AUylJctvKGgAk5QFvZ/yCZmsRW175Ol5uOSaQjo+781CJ+YwrWFnu1eK8Q5dWQEJ8DS
	OYzmHTO1EkZyP8BXvLhFcRvd6mC3lWal/6pzqhNEg9wKMkBsC681NLsRYpooH7bkrkNfJ3Q/LRW
	GLZJ+FA=
X-Received: by 2002:a05:690e:429b:10b0:64a:ec39:dd4b with SMTP id
 956f58d0204a3-64eaa7deab5mr8770494d50.43.1774237698447; Sun, 22 Mar 2026
 20:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bd45c86c-e1ea-4995-bb00-df83cc873105@landley.net>
 <20260307032258.2857157-1-safinaskar@gmail.com> <54f06055-c5ca-4b8f-9aed-065755e7c1b2@landley.net>
In-Reply-To: <54f06055-c5ca-4b8f-9aed-065755e7c1b2@landley.net>
From: Askar Safin <safinaskar@gmail.com>
Date: Mon, 23 Mar 2026 06:47:42 +0300
X-Gm-Features: AQROBzB-PQlqF6OH6A_aRUOwM_KQYLR0utQ15-12H2PLD6u8em4oEuDUzIPNaAM
Message-ID: <CAPnZJGAOPV26Owic+MoMUFaJVoofhLOjfmtVi2fi2GwtrVssYA@mail.gmail.com>
Subject: Re: [PATCH 0/2] init: ensure that /dev/console and /dev/null are
 (nearly) always available in initramfs
To: Rob Landley <rob@landley.net>
Cc: brauner@kernel.org, ddiss@suse.de, initramfs@vger.kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nathan@kernel.org, nsc@kernel.org, 
	patches@lists.linux.dev, rdunlap@infradead.org, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	TAGGED_FROM(0.00)[bounces-12142-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 41B562EC43A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 3:51=E2=80=AFPM Rob Landley <rob@landley.net> wrote=
:
>
> On 3/6/26 21:22, Askar Safin wrote:
> > Rob, I kindly ask you to test this solution to your problems:
> >
> > https://lore.kernel.org/all/CAPnZJGDDonspVK1WxDac2omkLJVX=3D_1Tybn4ne+s=
f3KyaAuofA@mail.gmail.com/
>
> Your earlier suggestion that at some point they fixed the kernel build
> so I can go "/path/to/dir /path/to/file.txt" (which didn't _used_ to
> work, I tested it way back when) would presumably solve my problem
> without kernel patches.

Cool! Please, write me when you actually test this.

--=20
Askar Safin

