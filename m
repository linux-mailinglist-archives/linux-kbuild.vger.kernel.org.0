Return-Path: <linux-kbuild+bounces-11355-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMx3CRJpm2kYzQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11355-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Feb 2026 21:37:38 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 658BC170570
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Feb 2026 21:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 687CA3008D26
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Feb 2026 20:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32F01C862E;
	Sun, 22 Feb 2026 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6CoXrjR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12301C2324
	for <linux-kbuild@vger.kernel.org>; Sun, 22 Feb 2026 20:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771792654; cv=pass; b=GGEUM/JYqknYDTUg+Yhj5YnXLIDtMkbWRQtxM36dJDudV61HMgPyolDMXMXJNNeeMPBtCRdXxZR1uGa3l6L3rOIfdE+K5TTtL1QWKUWk9E0maraGXZT+6QaFeVLtoNu70tU9wYbicZcgCpdpz9kYY+iXDkHig+vICHE7ZR9cuGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771792654; c=relaxed/simple;
	bh=1G1jnbq5K9n0GAuKV6cRNt1hZT8uLflms8262MRJ0ZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=peFBubxetIhxvZvcwVv2BqzAQuQ/j8Z1kUStYchJUSWskfwFEfdqGRryKhmSF3RtmQrIjrGst+YLBtl5ac3WHl8CcX8Elxh0d/yepNwGhWySc3KXhrs6wQtDnw7p1qeo6oRle3HRxxhWz6Wi4DyY8D8DRyWKn44+kimRQDo20iI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6CoXrjR; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ad4d639db3so17468785ad.0
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Feb 2026 12:37:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771792653; cv=none;
        d=google.com; s=arc-20240605;
        b=b0NqStNTwxf27zGrmNlP7RG2qtIimrlPEchzU1fAAehCRjLDoflrBHzV89eHZXYY2L
         XMAgkXZ70ZA2HqNjZJmBnk1VHfZit6upc7T6hS6HVWum7LXRV7Fh5n10S/w48vTdWwNK
         Efe89tFCFvsGBG0Asw32Gpxh9WwHj1t80DIR+piTZJUx/VoiKxxvKUyoYUWcdWRXgLi8
         xHxnivMSHTwl7j8mZbbjDiSi+sfKUWf+cxcL38fE3E6QBdR9l/8znnj90ijY7a77IYcS
         4umXdzJCysPVMrLQR8T0oQ+WQYdAyWwsidyVOJ8jaUw5BVC0oZu1ftRadvu16qRXsiQc
         rNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bq49wJw0ViM8IeW4KF1JyMB68EAXhB/pnLvq7XyKVcw=;
        fh=Xr2Qdi4mgn1fqZ6HBMPdLbeY3xyjoC7fr4yTYg4JTJI=;
        b=cEvg5pk6mNqKcjIZvBjxZ+1RZXpGkr0d0dAAGuKccU41OHiaPFEpoU6PEO0J5mC48v
         0J5OvbsYHoZOIuWLrrCVcVXkTDodhIcieVfWmgcqLupuzYLighGx44mgm1ZkwAVPOBxi
         oK7Ivp8J4gEuwPEsnxQ3mjxrB6x+XdxblNFgHCG7O34k3DbkWfmwtswSK/YR10qVE4ZE
         BF+jly8MqtBIJRRUb+LYVzdA5GB/cgOFOu8Wp2HGwc8qrAlSzkR7peOK4fsEHYnC5v3/
         IkOwy7Yfc6eVpHGPA6ic8/Ytj37C8/7OjsfZRQGPzFJy5iIFLbuYXcKEh9LMG4GsrbkW
         gmXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771792653; x=1772397453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bq49wJw0ViM8IeW4KF1JyMB68EAXhB/pnLvq7XyKVcw=;
        b=m6CoXrjRpLcB9jEqZPXevl5MIOKg+L43APARViJwyGszLechSchJiFvzkh7PSnq7yh
         vv6rSCIBBP79AmxfVTFN/LtRPwHlhJ20uATfjh3RmcP6oyV1b+Pamgdcvn0YDq9fjYww
         uMKYtewsLQAnZYtfDdlpZhTGuxaav1L0mAb8sHysFqwEem0WO6NTvGAil3zM2KfqV9Je
         2DqwrV449hHF0RavV7MBXUX/maNSc2vWIJpBfbl5lgjxtF2qXrIzJ3Jburz4fWr5ty9b
         KLsREOL4fT7sKWTpiD6cnya0l2l8QSyRWzDVFxz5DSnTRz0QTLinGRK5VwJJvjCtnp6h
         lqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771792653; x=1772397453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bq49wJw0ViM8IeW4KF1JyMB68EAXhB/pnLvq7XyKVcw=;
        b=lFal/qMm3ERcAXWBNbLl/V+kCA6J1KhCDt2FgDMhVQeDD6qqsy74oxOrtnHLfR8sHK
         +tg4oFwHjg0Y5MZYWVPZCIv9dQUUb3w8s9+sutHC9rf5sksWFi8wGre3QnZRYMCemCk3
         pQnyl/jKwlIeHPOeKNExt0m5evbZ+MbKm/SSywLpSNZ8alr4vPs2mEVRSPU+e2C7fm70
         t8jVsfzTJ2Kl9UfxV6+V+9j/vKl0ThDnqluIEwsDhfhBS0fMsUJ29tJO5x+Jb1Q1CLZ5
         PGM5eCXVrWHwqhCmMEcd9xNHZfjL/jP+1gzTVaO9QyXpyA3fqKjOJa1yD15jl2pkS4rN
         6HQg==
X-Gm-Message-State: AOJu0Yx9RndbBkLCXKnZp/3YPuO3NagqsGmeIYx5nP9XSYhJYoAUVcC9
	D1wAQSdler/6GeZAVIrqYgWyszNehHZz79TyLmH5LQI3JaqhbLMGvOYB0gh25h+DFmbDqaaWBOD
	+3/PnCZtMBuP5AYTmGhKdBhja/U8vRkc=
X-Gm-Gg: AZuq6aJwWkmxfJUd72oCyqZXQT9dHCWEW3fMNbag4gcxDpFozTwRiFMbGDAwXoHjL2M
	I8ElXClnnA0EC+al3pd9HcyTi9jCyOYukNQAXXxKK5XUTokiyZZ38KSfIflSODCH02cFKc8eLd+
	3aoIkJ30AY0U2r2F4BLiTHVcu38aw+JWmTV6yqPcVPP2TZQu6kDVWRlRRBP08/bpZc2h62eEKuw
	bZkV8PWzPgGNBCu5OlYg+fQxwZcYWYHnt/swrrUtqma0S9h3s4Weoa6tv/kVjV0zLL61g30C3xl
	iVd3Q3NPjECooDuMNx+g+8rgN3zbVyy4joz/qImw/O+NEzDCWy82CSibQFTfn3M=
X-Received: by 2002:a17:903:985:b0:2a9:4666:530b with SMTP id
 d9443c01a7336-2ad74463c1cmr52145465ad.16.1771792653027; Sun, 22 Feb 2026
 12:37:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACT+mvZJo4ZdWbwY1=MpJqJg=Xf3y4QCiSy9APvMZaCh4GBBKw@mail.gmail.com>
 <fd7a58ed-e8d2-4101-b89b-297190b41813@infradead.org>
In-Reply-To: <fd7a58ed-e8d2-4101-b89b-297190b41813@infradead.org>
From: Bogdan Metla <edistuo.revresbo@gmail.com>
Date: Sun, 22 Feb 2026 23:37:21 +0300
X-Gm-Features: AaiRm52xb8BFKunJogc-HkrnElhdZ7Q500lh6CFF05aYlFYQ4Uekhl8oLY7sbtk
Message-ID: <CACT+mvYktZ3ryF2ceHGFREwF3=pCR9LsYoo6fBgBdN+Od4crLQ@mail.gmail.com>
Subject: Re: tools-support-relr.sh segfaults when NM is empty
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11355-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edistuorevresbo@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 658BC170570
X-Rspamd-Action: no action

Thanks for pointing to the similar fix in check-function-names.sh! I
tested ${NM:-nm} in tools-support-relr.sh and it solves the segfault
when NM is empty. Here's a minimal patch: ---
a/scripts/tools-support-relr.sh +++ b/scripts/tools-support-relr.sh @@
-16,6 +16,6 @@ # Despite printing an error message, GNU nm still exits
with exit code 0 if it # sees a relr section. So we need to check that
nothing is printed to stderr. -test -z "$($NM $tmp_file 2>&1
>/dev/null)" +test -z "$(${NM:-nm} $tmp_file 2>&1 >/dev/null)"
$OBJCOPY -O binary $tmp_file $tmp_file.bin Perhaps it would be good to
apply a similar fix to tools-support-relr.sh in the kernel. -- Bogdan

=D0=B2=D1=81, 22 =D1=84=D0=B5=D0=B2=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 21:5=
1, Randy Dunlap <rdunlap@infradead.org>:
>
> Hi,
>
> On 2/22/26 9:19 AM, Bogdan Metla wrote:
> > Hello
> >
> > Problem:
> > When NM is unset or empty, tools-support-relr.sh executes a temporary
> > file as a program, causing a segfault:
> >
> >   test -z "$($NM $tmp_file ...)" =E2=86=92 test -z "$($tmp_file ...)" =
=E2=86=92 segfault!
> >
> > Root cause:
> > The script uses #!/bin/sh -eu, but -u only catches unset variables,
> > not empty strings. When NM=3D"", the command becomes `$tmp_file`, which
> > tries to execute the temporary object file.
> >
> > Reproduction:
> >   unset NM
> >   export srctree=3D. SRCARCH=3Dx86 CC=3Dgcc LD=3Dld
> >   python3 -c "from kconfiglib import Kconfig; Kconfig('Kconfig', warn=
=3DFalse)"
> >   dmesg | grep -i segfault  # Shows segfault in tmp.XXXXXX
> >
> > Expected behavior:
> > Clear error message like "NM must be set" instead of segfault.
> >
> > Fix:
> > Add explicit check at start of tools-support-relr.sh:
> >   : "${NM:?NM must be set}"
> >
>
> or it needs a change similar to a recent one in
> check-function-names.sh:
> ${NM:-nm}
> (see https://lore.kernel.org/linux-kbuild/20251219214252.GD1407372@ax162/=
)
> or the top-level Makefile needs that (although several of the
> scripts in scripts/ are run directly, without using Makefile),
> so each script might need its own protection.
>
> thanks.
> --
> ~Randy
>

