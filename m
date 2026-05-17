Return-Path: <linux-kbuild+bounces-13187-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Czj1Or1aCWrKWQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13187-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 08:05:49 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D0D55F64E
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 08:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E80D300CE70
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 06:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7E536AF6;
	Sun, 17 May 2026 06:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcuHCFnD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655E230E0D4
	for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2026 06:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778997945; cv=pass; b=Q65O1mcArB+0+kby9NHt0XA/BD+R3+DkAA5oQIqjhRznknglZVhDEBd0/s645j5Ak3/8PGZsPD2C55jEmsrRFJ4jchoUlF7YkDt32T100v5B9LiLyYg7Uk8lDz2lAMeryw+B0zegwYovYqFXT0UYq/rIBUyiQbzE6mYwh6XqguM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778997945; c=relaxed/simple;
	bh=NIfOp3H+fBf634aBcEEfMrRh5iS6XP6r1lQpzxgi98U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPjWOFUJfgzXXffE3yxmzN0/kg5FFMVCQT7uqigMTOTtFZtxBV3cf9ohwpX3Eajkx9tIJV9mAc221jr0wyDL/LaTxqOwrvmYVjyz0NQsYfIzIyM4ZQsRPrH7kmrnt/XkOi3G2g4E1u3EVSFzDgjkHJy7m8qNZoL5hHbGXmXzpU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcuHCFnD; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f24905306dso61978eec.2
        for <linux-kbuild@vger.kernel.org>; Sat, 16 May 2026 23:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778997943; cv=none;
        d=google.com; s=arc-20240605;
        b=IwbbNv3vEdG3oMUTlHjJKOaFkxSSPAWiqdXNgJVdJKtJO5fCnBy2UWPWiZmP9IYUxg
         PRQaZZw6TRaCiUV9eKBU7/OWR8PFOQ64BVPo8DMRC1fCw3jx/8vuauyIAniV9P4ALeTn
         TUk2xI69jJDnxcPh3ReBKAPqUF5G3db/Oiy4UtGD63UrikJ5rTyL6vnnWJdwe8ANARfq
         Cwuml+BD3yOh895S8Z/FFkuN8Ny10ioqqOt+BsMOYoGS0bNBO9cnRqOLx1VQQmnP5/0Q
         kf3/jFRgjyCxo+Gx4EbEnJWlyIAElR7lou+1NiSIWp/fCsqUpgAUnMCHBDJ8Jcai0+Bl
         tNrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KVZVcv+iMQKvayZufdg9CpftdHG0Bh709nb+gr8F0U8=;
        fh=TgnIWPS0dM6HpwLndbxcYXMqWD/SvY9+SENovQL6QpY=;
        b=J7K5cnxNQsJlGK/Bn+w64Pk3m7RnYRpPApvKYuPutxCjS2GxK3lSdF0N580oVAcj+X
         YDgWh1rVG4AUQV/nQn0vmCB846H0pvoWSyoLuvNQ5XkvC74g+Im0IkfDUbemL4Fohpfb
         u2sCVf6in3NJM6eBXQ1ugZls3MMjOSIzNcjb/mI1q/MaZsgPoEQbCjrE6EA7rBdXktW4
         QQXqcza+bcKdblqGoS0Bum0We334SHfOS2rXDh4Zm2TNlRFIZVlOhLJpMNRor5OQZO+X
         50qYjjV+JbnZ4HSXupT3aAgg4HmPOD3hevrZCsMbbEwHKLh3VZ2WNupWveHfb5N8GTM/
         tBcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778997943; x=1779602743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVZVcv+iMQKvayZufdg9CpftdHG0Bh709nb+gr8F0U8=;
        b=LcuHCFnDo9fASZNRc/LD1I8mMIlLz6PMOPZBlUZHw2C90QqGa7XOfqxzxQtuRJ+ESR
         85+ojIWtywR0nIhzzb7F5C8pRHHKBSILK9GaJaSyitFlSBRJdcFpLtC4gP1wcs90dzWt
         ulsfNDqCkyVEXHWzI5PkFUBrTOFTPoKZ8lURsk3xXoDYr4+1A77sSvWzkYWPULSA9FNd
         sq7eyvJiJf7CXYDoEdjhIdQqBrCt+ERBaqUA2zS2wi0rlMZWB8QH6znjRlITNfib5EUV
         bOw81M0cnbZs0FDWurjLhFUvPEUMvLlfO8ftF0+maYHk7VJ+7QttOEpKMnsbbTpURq4c
         CQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778997943; x=1779602743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KVZVcv+iMQKvayZufdg9CpftdHG0Bh709nb+gr8F0U8=;
        b=ivtNfVZouSmjiXeF6uKUeNncIdvQLQoBctGVSS1CJH95vj9CPL5a/65F8W7hHYLbY7
         w1ppR6gjPbr9bnGcGQk4BMop6sthTDWYZC+GpiTCzqJPgF4EG7ymveoCdmlohpSuIV46
         HXLUc0XQFKIbUYZz9SFyHdRE/1H6Sn4VQO08B2irZxLkvebZ/5cekQPNOLDdQ8lfrTA4
         cNPPp6WNYWBD/JhS3BPj/S6SstrMvJk6DLKXaLYKKXsEV+5MeXHFMzAsqwtjLlt14lWq
         k6pBjR/eHELP/vMX4zUDfYkz8WPUpIL0Q8pKjAo7hFFvXkbZ2LBZAGMKRrrEjloPNv0V
         QgTw==
X-Forwarded-Encrypted: i=1; AFNElJ/bJ3GgZgqOP5AXOCmOPxXszgi1XwNywO+rBSCNQYDhrSpjFsA6hR1l8kN2KrCMo9awfUAiL4z/Ii3SrMI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx23lx2jRAQnaSATKvVpUfnMC/PE785hD9Nnqy/X4lObmbJWR9X
	BxXafcN8Zs37CwwREqnkRH91lSx/5RnGt+4jKCM6Tm2Mt0WGhSrKlKg2BS9VE6Jupa4vrjpsqTt
	dVyTvMsr4DLNEO8mqo0XHGdVSW3YC5HM=
X-Gm-Gg: Acq92OH0kF2giBNi8+vK5jgsETG9cki1VxR/qBVy0nbtEULkK+k8zRHPh7gB7m2/6l4
	uIwmmszjDeF9ceWGnYQtvqm16Ut0l+00q5Kr/1p0BeW1ikacTfvEqGcip5WDE1/1pUPzjPcYEBz
	Eg5nvlDOpIONslOhL7Yc9/mWx6Bf889/6GNwZuQQuL7cw9vEuwXYGEWG7ghfxITmlwAouQzzwGv
	9//6BaglYTu4WtZptdSZaWtn3VJuPBYpcwt0Lle/1/x6PEZVBxNat22W5ddvVZ7GuQCQ4E/4H6g
	kSOmVBQHrz828tQ2WjdZubHtBz2Vdue2G2QmoeamvGe/uUHiqYB7+s+pzZPKsvRR4cRS0nI05jB
	2iAxlTnfZ+I+nYrcVMLwACLw=
X-Received: by 2002:a05:7300:ef82:b0:2c0:c55c:156f with SMTP id
 5a478bee46e88-303986d6062mr2073868eec.4.1778997943409; Sat, 16 May 2026
 23:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com> <20260516215354.449807-3-julianbraha@gmail.com>
In-Reply-To: <20260516215354.449807-3-julianbraha@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 May 2026 08:05:30 +0200
X-Gm-Features: AVHnY4JDLNTOr7rmluha53m8xnMSfI_2zj_-n0FsyWKVI29ECinwLPYxnOOxaUw
Message-ID: <CANiq72=dKOhoLUoWRmzG9Kyv0jWY97Nx_O4rWV-UHjRtULz-jg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/3] Documentation: add kconfirm
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, jani.nikula@linux.intel.com, 
	akpm@linux-foundation.org, gary@garyguo.net, ljs@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, masahiroy@kernel.org, ojeda@kernel.org, 
	corbet@lwn.net, qingfang.deng@linux.dev, yann.prono@telecomnancy.net, 
	demiobenour@gmail.com, ej@inai.de, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 44D0D55F64E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13187-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linux-foundation.org,garyguo.net,arndb.de,linuxfoundation.org,lwn.net,linux.dev,telecomnancy.net,gmail.com,inai.de,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Sat, May 16, 2026 at 11:54=E2=80=AFPM Julian Braha <julianbraha@gmail.co=
m> wrote:
>
> +kconfirm's Minimum Supported Rust Version (MSRV) is v1.85.0, because
> +it uses Rust edition 2024, and this is the earliest supported version.

Note: this means it will be the first code within the kernel tree
using the new edition.

I think it is fine, since in general no one should be copying code
from here to kernel code or vice versa.

(For context for others: code in one edition can have different
behavior than in another edition, and thus it is risky to mix them up
by mistake).

> +In ``scripts/kconfirm/`` run the following to download the dependencies:=
:
> +
> +  cargo vendor

I am not sure how important this is for `scripts/` and/or `tools/`
(Kbuild may have a policy), but this should probably handle `O=3D`
builds.

In some cases, the source tree may even be read-only, i.e. we wouldn't
be able to create `target/` there.

Cheers,
Miguel

