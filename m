Return-Path: <linux-kbuild+bounces-11079-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGD1AI5uiGnOpQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11079-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Feb 2026 12:07:58 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C3A1087C7
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Feb 2026 12:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17D71300F5D5
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Feb 2026 11:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8806532860E;
	Sun,  8 Feb 2026 11:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxiBwl43"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA742F49F4
	for <linux-kbuild@vger.kernel.org>; Sun,  8 Feb 2026 11:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770548650; cv=pass; b=CevMqxpuxdeGud0ucAfZ9lFV2OlvEEtUR+ISrYN8NqT3KwDWqaD4KBavhirLcET3CWajCA514Nvlk8cDo1UhVsoGVsNfuQbh458Dtm5MjxjhLEPkx9Gq9WfEGxY4riEHmtUFHnzW+Ccf23YiG2IrhSpCtAWQkWXVBkYf9vOW6Rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770548650; c=relaxed/simple;
	bh=CsNWPa8nRGpboGQ5lGfmNf4LauhVBQGyeKOsESLX8uY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o0EzcbQmXUOLoQOA1vEeGsH2djtHssrpXmHj8hi/vOafHaqWAIwYav2Xs5TwvJHWBUIShunpQ1+le8Oq1WIIt+zRsbrJIDMUVFvLMOrRI6/WviCCeFFe1/JJi/Q2abNw+fuSl/jO6HjZ08yxlwaJhx8pJ5nlRVU3v6AS69SELR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxiBwl43; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b867142b07so110317eec.0
        for <linux-kbuild@vger.kernel.org>; Sun, 08 Feb 2026 03:04:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770548649; cv=none;
        d=google.com; s=arc-20240605;
        b=gJTvGabdCrV6gm2W5Da3450DtslPIZFotBVitgz36jTutgFwmCDYIWEfBxmxX2bXri
         Uh1clHtVHcxAFqdhoY0wqZGbTxqgkX9LlwOoUhnpXqkNvU95aSSi7UpqKbOBTNtuEC4v
         dHVrSbr0r8aTtOs8cbW0lOtMl4ZP0RZgBEFdV1FVYLm2giAnJA1IxKmX8f+jWhVpKYBZ
         uvodi3q7Ge+lhuN5A4vFFOpWGxWXvyuoKY99MGjTTi5bW97z8Kocq4ENjvXVhp2Mox8z
         mUPsMgpE9lhcMa+7aW5IUxC/9o2kNKjj5cwVSTZlVEAz6eDdzoauUkvSOLqkVMC+l6wh
         RA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CsNWPa8nRGpboGQ5lGfmNf4LauhVBQGyeKOsESLX8uY=;
        fh=e3LqkQvdoQ6gpN67OG9oNJuBqSO2F7pT/9yJWxw2+WU=;
        b=I+tQUfg4E8VcX58ImLEXOrGJigcFZ1s3V9tlTz/rR+mxT8WDX5VWWMZPiTAb8jKRgR
         Sum61bHzsvYQXrygARRkAqNXz4iWQX/xZzZ1EzNxRHB6PWrNc1sxgUaA0NYQ+79GGK4z
         wRnyszeK0OJvyok/xOx+cDvsTrU9qTZ/UGPv7kK7PLQYgfHalpV2v7SXoPXCrgEgML6g
         VDpKVjFMMWGUuTXKCkcsVEUTmDSTWtMBtvaPbvS12hkwny0iEx7NQhm/nCL0Y1noATBn
         qBCdJg5E9p58lQssIQbsUZ98J0jHADdbJnl6lbvBj0aWXFHKthEm65MVCEQgWKxgesIr
         snFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770548649; x=1771153449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsNWPa8nRGpboGQ5lGfmNf4LauhVBQGyeKOsESLX8uY=;
        b=CxiBwl43vYWh1Iy4jF482fZhT/7NgLPHS6Wec9LU+OmS4C54ozZVScHh4n07XTDNVg
         1oFCOemnOZhEUiAw+3LVnxmBDa4Q4hAs6Bacsb8t4ihO0Yq5N1VAJsFO6Y2lvA2lkw60
         7yQPL8q+QK7f8eb0KD/dIctC2mzXhb734kHsBng+CR3K9EuzUp+pwONlJLdvqSnzsrr/
         ken+FekfO5lHJduNsHClbnaqHdme9d1J0Tjj5VRSylEJrW75iPnxfogNwkIE0NyF6toZ
         zUbA5S6BtkcJKwb9BGRSAwKGTUWWtWtYU0uDdwme/rOVUUDYOgrsCcoxsWRy9j5/rolP
         LibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770548649; x=1771153449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CsNWPa8nRGpboGQ5lGfmNf4LauhVBQGyeKOsESLX8uY=;
        b=rAoxcEhy6s878v9q5E3JempS0fDCrHdk7xKjCbTm5DW9ekJDLfXSJ+/6uInHd15w5m
         zwbk0WCFZznAm8AsVSyvZuI/NAGQH9Z/85MrjJRFCux63iVGupRRHYN6WS8WYy995X9d
         2JZN51xb7jg0kUhBHGy6QK+IV3wccdRGP8Kl2myoWXQ1lqxUYnrkItjPdcwRQtHzrYsC
         dzMSV9/w1r16Y9UsQJA20MS9m4AtydqcQcbiplRm2dfcOBrVdZwPSPNEmpvgwa9V7V6z
         +VaV8NPifnPAR6dYiASSMgzfhBoAIFNZZWVHT3/fff+bWZYB9mIqhLKUkJAFNW27iMqd
         ftdA==
X-Forwarded-Encrypted: i=1; AJvYcCUqAt47ULgDK12jgUgDSsqQuZfGtYl0o6G/d4j1RwooJJiInPnprfJUvBCKgkT9+560rvKlNaPn5A2O2Xo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOjOvqJeeoyAoYkSXfIXPTF93Q5i5UlDtwK957D5aJ6FyXrTTx
	KAOSsKavSELe2XjdViMqytdmGNZA5E2EF+iLA6AIyaHNL8KM6qyhX2TIKVJLwjZQB9Hfsb9+zRD
	uwRBvzK5xMb3NpeZ71juUbUVh0l3xgdc=
X-Gm-Gg: AZuq6aJv1EjLSFV+X2dtdKJc1dyMCtGxKgdtiRVvQchJzdVjk56pfSxrSMDPiKke1OI
	LiltJZTTVyRlKjDnDtRTwrmEBFK6IzHrghsoj9X3GhFF+N4HqFMgXOvZAobYTPkFWC1Zxmog0ZD
	V/a9xGcJ7lb6Fy2b2+PLmJnPu/MH+4acFoRaNyANCkx/1KivBUPtXkTEFOWuKAsosQsdujlsTaY
	cLgRfC7Oe3/cVpGXomfv4kc25zIoPz+SUIreWYDzcDlQ2SXe8bgjqFUfrvxRJX10eAfGbHCaQzR
	N3gcYGEPeX/rC1t0Y1OtSzCFOrZlzvCW87LGGqJurJaYD8oromxJEFhn1p6Ws/pVIp9kdXNI29E
	usI+L/MGsXqMl
X-Received: by 2002:a05:7301:2b87:b0:2b7:f145:a98 with SMTP id
 5a478bee46e88-2b8563eb1c9mr1959257eec.2.1770548649242; Sun, 08 Feb 2026
 03:04:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260207144356.3063613-1-gary@kernel.org> <CANiq72mhhSKV=CecnZnqhKrt9tpGdMu1hePJtGDgRiD4JG902A@mail.gmail.com>
 <DG8VP6BH1MPV.13AHBBEMZHOF4@garyguo.net> <20260207220543.GA1670883@ax162> <DG93P7TMCWCH.3ACJU31B2HELW@garyguo.net>
In-Reply-To: <DG93P7TMCWCH.3ACJU31B2HELW@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Feb 2026 12:03:55 +0100
X-Gm-Features: AZwV_QiGAqvY777lSs0t_vpiNfu3S-LU0xFEazl0B1d7VPzfby1MCczbD-EY7Zw
Message-ID: <CANiq72nwU7C9+atAXoyKbVjM=4coMjxMSLD8YmECUVuw6Jp=_w@mail.gmail.com>
Subject: Re: [PATCH] rust: build: remap path to avoid absolute path
To: Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Janne Grunau <j@jannau.net>, Asahi Lina <lina+kernel@asahilina.net>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11079-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,google.com,umich.edu,jannau.net,asahilina.net,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,kernel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 52C3A1087C7
X-Rspamd-Action: no action

On Sat, Feb 7, 2026 at 11:59=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Unfortunately, using remap-path-scope does not give the expected result i=
n older
> Rust compiler versions, so the issue reports that I linked will not be re=
solved
> with it. It looks like remap-path-scope is working as intended only since
> https://github.com/rust-lang/rust/pull/149709, so Rust 1.94+ (I haven't
> double-checked the exact Rust version, but in latest nightly Rust, the re=
map is
> working as intended).

Linked the stabilization and noted the fix 1.94 PR that we likely need
and this thread in the `-Zremap-path-scope` entry in
https://github.com/Rust-for-Linux/linux/issues/2.

And since it is now stabilized, moved to
https://github.com/Rust-for-Linux/linux/issues/1223, which I just had
to create due to GitHub's 64k limit on issue text...

Cheers,
Miguel

