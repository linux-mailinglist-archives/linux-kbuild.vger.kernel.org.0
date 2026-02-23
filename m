Return-Path: <linux-kbuild+bounces-11380-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cM+wIx7dnGl/LwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11380-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 00:05:02 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4752B17EC1D
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 00:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB9EB302CEA5
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Feb 2026 23:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3653B37D132;
	Mon, 23 Feb 2026 23:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrAAB+3k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E504137D128
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Feb 2026 23:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771887898; cv=pass; b=BHCYWz4VH2S4c9tcCWcUASfqrFngKSIh88lQgjmaBq8TYqgPEh2iPl4S3T34uOr/UuNIUMlNdRtcvKCJw/qGyga/p0SOqpfFfPVLCrpAGI4D3KCF8eWL4dxJHCfbqinuDI2sK91Zz7PQ/EUYr/BTTrysb/Lgz+FEIA4WukmQtHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771887898; c=relaxed/simple;
	bh=5iVARBZLENhP06ggeySaiFzVdgp8bTAAtxPPZZI/s4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+lv2esN5vGk1HfruGuzrnkiqPMHCTbjkdZ6XScqHl99AYm6GhDPs6HEu3VanQNdPL1zAtV+6AOXnIV4UliFKvOgfs7n+KV9kiXooutdSa4OamLJqio0ODyqiREJKTtE0vVh8NTKEYGI33Y+gZVJ2yA0v0DCCAZOsd01bfItGcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrAAB+3k; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-797d3864d89so47144877b3.1
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Feb 2026 15:04:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771887896; cv=none;
        d=google.com; s=arc-20240605;
        b=TQy4oy3rsXFSUuztP83wJsXq+WfVUkQnUg5Hv8pj13OrOxKXWlZlnRn5Knc5+rBreH
         8OYuh266Pve7j/mnree3fO5wHb0WpyK5vm5IPH7vvA7DCRUqy1MZkBDeSyPNi9F7wWjY
         t2e5Vl1aIMgP95b9w9dlM/NfkXoD8bNL4LNhzfqsHBN76nroQacTzYhP5BGVsPb0oA/4
         dq+Xw9lNURRAEisnlaMrL/SsHmo23+kqLB7HKjYTx37YMKjwbO7McHnRpsqS+dZtxo4l
         5WQBGlLm1Mgc1al6kxzhJDLBpFrueV3t0yZBIrjHVRCmi7HpfWj2tc8s1jN8/msDoi8G
         7DOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5iVARBZLENhP06ggeySaiFzVdgp8bTAAtxPPZZI/s4k=;
        fh=8zHxtt3VZvq21VxTvH8QeEelQItKgLZjgRMSCG+wuLo=;
        b=Ovmyp+qsO5U3sCvNNONMNVGTbqkm3+KSnB6sv4t8xSIph2mWEJv5r7uq8kct60DN7j
         E9g5u0knEhpMmvlsIt3BPs99FxeShPLJy/Q6lobPxeu7GFh/R7rWBvM/4tlYEgbGfoHi
         WFeCuASgUqglzBQZJjSSwgSg+N70GxxkT/ka7HMVAzGwGZPSz22rYLTcWEy96TjRXotv
         AKZhXe3CDkegsOiyXZvNu5pPg8zAPdF4a5/Hk5/R3/vUCYNQxQW3sCII6yKF0GxM7XAW
         tSXc/2rG8aDwDI+SMwkI6asbdI5gwmgd6f/kgxK6/i25aqVOBV4MTi0RMjOn+WMeEX7C
         WRJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771887896; x=1772492696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iVARBZLENhP06ggeySaiFzVdgp8bTAAtxPPZZI/s4k=;
        b=DrAAB+3krUOPSUGm37lQQJkEE9HoTlGF/HbNs4GdWUTZ4X3lXfQHENhFxfKUwTqVJL
         4qeJbAIIy9RrdZgTqqPlnRE5+VUa+kwk97S8W3i5mryiRtrHkoyr1WORYyrUv5za3fcP
         HSYlTgpFgrOrezAPiqjcfLlRqrwFOtQs82Dd/gT/gqDPupCekCkXs6vq6jiYIZ+SUf17
         4PmtxsVvStJGhcGZh/PwkwWNH1erbD2wZRLF86q/Q3A7tOaieEfIlrVloBDA2jKBbQ+4
         w0Fvmnd1XbjXStYEF4cDYW6VHqq55y1hnVpIYnQk8DXjaVET632P7JBM1bwSEbb9YNC8
         TxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771887896; x=1772492696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5iVARBZLENhP06ggeySaiFzVdgp8bTAAtxPPZZI/s4k=;
        b=vp0Sz/6RtPTBP9urUPQpjl5lbi3zpmyv68dmS3RuEWQdtmkfviKlLeFqJ4qyRtkO9+
         JiB0ZwdEhRe+YLxc7hfmIbUIQ5D9JiiOtrLQVBE9d6ipmZWbJawTOTj68OTLd+lqPPZT
         AQLWEPPL/vR0pMeQ7w1rbRbbKLSfsCrpeDihHG3lgNRxt9uZYZ+r5ZM2Fv77MlPtMbef
         n8lsHmCS+yxMc17m823jruWuJicDe4zU1nTEPybEgFMMsGrjIPJoonjQXRY5JWPIYtYG
         xE2d8USVeqYeRPq4BBj0CioCqbgCyy3cAIqT7Kt/zwNo0qr1DB7n/zF2uBMM5OKSQPZ4
         NrXA==
X-Forwarded-Encrypted: i=1; AJvYcCUKAtmo3kFUGALcaaQspRrJBj/p6DP+rEBKQR1UCEDCoa8YQvmUSyoeg/WHdLmoUIX0hcbvP+agXl0Uy6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuCfUE6ZWLR7KBuLDSYDg8F2U2VGUQShPHD0rCMY/lTgRJHSfN
	TkUtdOX2Gqg2E/7OdVS/IcG0ktZ93+LLTIJ+yqPvhaYeSX0u+gQu3DWJwIeOTtkHaUd8A5glCFj
	0Q3VUiafe5L5vLsfvT6DpcHr4gQWSXQ0=
X-Gm-Gg: ATEYQzyEVReyrR9bRc/S974wJ94QEuMCWBDimf/6dvbp8Z5w/rj5fdFeW+0yeaY9Kxt
	549207kaX+N3s9VF1UmaS3qnZjR4WAWlT1GKgGCvsYAqaAR7y+K+itpEGL+5zZmKwYOpYASVJ2W
	rdNJxduauWFlRhr5FdeVO/pWkLaGFn0pb2nIn2qYm65N5zSZiqwUeVwLCpbYn5MgsRJOSs2rwcL
	M9tVjNzk7bgYeJsDS0NwTdn4xm0u71f/DWl+OwgRJxGx9P00f154WbnInTwYhsrV8riJa77A5Qc
	VZDDU/M=
X-Received: by 2002:a05:690c:f09:b0:798:5333:ce36 with SMTP id
 00721157ae682-7985333d4f3mr19166357b3.7.1771887895866; Mon, 23 Feb 2026
 15:04:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219210312.3468980-1-safinaskar@gmail.com>
 <20260219210312.3468980-2-safinaskar@gmail.com> <20260220105913.4b62e124.ddiss@suse.de>
 <6d34c95a-a2ea-46a4-b491-45e7cb86049b@landley.net>
In-Reply-To: <6d34c95a-a2ea-46a4-b491-45e7cb86049b@landley.net>
From: Askar Safin <safinaskar@gmail.com>
Date: Tue, 24 Feb 2026 02:04:19 +0300
X-Gm-Features: AaiRm51ShYWisRZxqEP2jfYkn9npSVqKeCstRJL8gtXtjrs-RidKNfYk8lXIBQs
Message-ID: <CAPnZJGDDonspVK1WxDac2omkLJVX=_1Tybn4ne+sf3KyaAuofA@mail.gmail.com>
Subject: Re: [PATCH 1/2] init: ensure that /dev/console is (nearly) always
 available in initramfs
To: Rob Landley <rob@landley.net>
Cc: David Disseldorp <ddiss@suse.de>, linux-fsdevel@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, initramfs@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11380-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,landley.net:email,bootlin.com:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4752B17EC1D
X-Rspamd-Action: no action

Rob, I THINK I KNOW HOW TO SOLVE YOUR PROBLEM! (See below.)

On Mon, Feb 23, 2026 at 4:27=E2=80=AFAM Rob Landley <rob@landley.net> wrote=
:
>
> On 2/19/26 17:59, David Disseldorp wrote:
> >> This problem can be solved by using gen_init_cpio.

I said this, not David.

> It used to work, then they broke it. (See below.)

So you have a directory with rootfs, and you want to add /dev/console
to it? Do I understand your problem correctly?

This is how you can solve it.

Option 1 (recommended).

Let's assume you have your rootfs in a directory /tmp/rootfs . Then
create /tmp/cplist with:

dir /dev 0755 0 0
nod /dev/console 0600 0 0 c 5 1

And add this to your config:

CONFIG_INITRAMFS_SOURCE=3D"/tmp/rootfs /tmp/cplist"

This will create builtin initramfs with contents of /tmp/rootfs AND
nodes from /tmp/cplist
(i. e. /dev/console).

This will work, I just checked it.
No need to build the kernel twice.
Does this solve your problem?

Option 2.
Alternatively (assuming you already built gen_init_cpio) you can
create cpio with /dev/console using gen_init_cpio and then
concatenate it with cpio archive with your rootfs.

Unfortunately, this may require building the kernel twice, as I
explained in my previous letter in this thread. But this option
is still doable.

Option 3.
Yet another way: run

usr/gen_initramfs.sh /tmp/rootfs /tmp/cplist > some-output.cpio

(again, here /tmp/rootfs is a directory with your rootfs and
/tmp/cplist is a list of nodes.)

Unfortunately, this requires gen_init_cpio to be present, so, again,
similarly to option 2, this may require building the kernel twice.
But, again, this is doable.

In fact, gen_initramfs.sh accepts same options as CONFIG_INITRAMFS_SOURCE,
this is explained in
https://elixir.bootlin.com/linux/v6.19/source/Documentation/driver-api/earl=
y-userspace/early_userspace_support.rst#L70
.

Conclusion.
As I said, option 1 is the best in my opinion. It does not require
building the kernel twice,
and, as well as I understand, fully solves your problem.

If I miss something, please, tell me this.

I really want to help you, Rob.
I sent this patch, because I want to help you.

--=20
Askar Safin

