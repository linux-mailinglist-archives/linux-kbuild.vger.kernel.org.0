Return-Path: <linux-kbuild+bounces-11527-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PYXEJo2pmlJMQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11527-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 02:17:14 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9171E7965
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 02:17:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 762C4302D94E
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Mar 2026 01:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61532348865;
	Tue,  3 Mar 2026 01:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rXzKTA+P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AE9359A8C
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Mar 2026 01:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772500630; cv=pass; b=DA8mFNK5wwPHL4eBPIdKDjA09XkAizKEmtSQxv/If9ujfyMcT8Nx3LFBauEayc1T/Nq/XfMtLJtrOqLM0n0YwPzuRY8j870O+GhQcyFbPQ6niXw3wgxWkbLHFhkhB8kDpff0nmj3nKhdjt4RTi/XHFYu5d3ob7lIRGKB7PJKAEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772500630; c=relaxed/simple;
	bh=Bo5eBFPDxisPJDLCQ5T569sq5/MPMjMeBVQKOyOOwMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oyj8hEP2a92vX2QVtOYfbZSApHLo9uAgE3SEN8heBBXBPZSnG/zzKmcPLOVt6WQrHWDhK/4W044eVtNgd5j0NFweAD1gsDSBTdjnQnWUb6v2ofjitHF81jUm/EK5BKnNMTDTcDc6YulSWaE3d6EiPe/wM3yhL88NwSzF/JAjMos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rXzKTA+P; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-899f27df3d1so19814046d6.3
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Mar 2026 17:17:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772500626; cv=none;
        d=google.com; s=arc-20240605;
        b=XkguMfTIsx3IbhZjIAKVpSYGhi/1Z5PyiungXKntWbqWuuURhAj1Uq/NZ5BSXf7YTE
         YAq6yUs5F7DKYXhxXgIK0qtgCRl89KAhu3qzVxmPvKDIllRBbla2/IxEm4j4dTf0mxwu
         ytgTZQsQgSyTI+o7K6Nflq70uANAjqak8in/Fc2L5UNiLCM9+/aNjLR6I+jz0ghadTrI
         7hZglMyN3KUva5LdImtB57vdWJZYs7Nj44j9GG309MFUEOB+OyXm9V8NDHtZixiq33bj
         KA+DHGoEfEb6tgNzhBfpRx/tBTYZmo/SqTHNBYJXVmcS2FL3fktJ6OM0xmLDwW5vHJmU
         MMLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2YfdyqXPY3aXxeRmVKZn4QiIqi7Db4ttPeHa4wKAW40=;
        fh=vn8mHRF4VcR9/u2L/8bjSO0aBxF+1TIAgM2POwc7RLc=;
        b=RBY6YQZTpSBJz8OjSkeXfhAsMXR9iO34OnVcfgPSvM6DB/umWoUihFho4EwaS/3UU0
         1yXk7i/Wywv8dQJHK4096dOfvcF5sB1rZDV6TA60pcxWMjWmP7JeFsEBHyogTCkHKEKy
         33HwFbTk/mhXtGHt3dgx7OTkNrjM6XYXvHyXdYdlUE5VB12KvhidPA1qfEwch5gwmvvg
         LbR+vpuvTcBj2zn9Xxi8o0gajPquNg+a62SdfS5LDeAw4uTbdmO719bHK2camny2NCw3
         Opc1uZMLOy1TEzu4Kh1ufUMumPcrLpL3hud5A37ZM/t2iwEtpxIRz2L/4ye8UzJMS22B
         gbmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772500626; x=1773105426; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YfdyqXPY3aXxeRmVKZn4QiIqi7Db4ttPeHa4wKAW40=;
        b=rXzKTA+PbWWyO9f2L/rAZAdTUAjD1SuGg4AgiWhi2VTFz5xidLJn6ecTYaaHkw7F5z
         sZgEVZu3JUHEJWcq+d/c9YJSPlBPuxpaEPoQZavNaMqdFaYstyN0Ro8Rs/gljZGesPu3
         zjBAT5k3S7tlU33XMc9kP30S5fboA4hPMkHmOwFwcNEiSCFzDo0THhdTF1OIldVQkowb
         4b5UWz+kYpEeW9GTK396YnLO929mdFe3KAHsrtEaqCE99jqdZPzegahTyPUEAWIAlL4B
         q1RgwItnufhNKTtJ+0f2Kq9T64gYPgszaAYmR7D2rZTx3t+R/V1My5pKrow36okdHsaC
         6O5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772500626; x=1773105426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2YfdyqXPY3aXxeRmVKZn4QiIqi7Db4ttPeHa4wKAW40=;
        b=awwtjM3Wx1h+ZORVUlTs/zY1Stu360Vi1jIl5ViJ7aiLs+OMYv6y3hcecD2/4RP1up
         C9EmfObp4BqN8XIozxglZvmy19ZrBd1OWYu5g+m1y4VeLMyQivWDe+tVkcaBGuh6d6/Z
         U0prWp0BCDK4mAZH0Lj6FiWVtVQMy8hEzoMGoBWAelLP22ao39CQIOvKNM3qRftcUTUJ
         SO2DfzOWPLNtBljNXBb88az8lIGGqTGW5FRR4z0XYDmXWXVqnLbdu5XwdRVHPTzdLHhd
         h3SE4ZRUas+BfnYg2WPC+kcqnrLh8PWY+XkTrhFWxJ4bYlPiW/XiRuCK8kxX6G5UX2BU
         jIkw==
X-Forwarded-Encrypted: i=1; AJvYcCVm0/o/GxwUO7hbvjuga9P++/nKp1Z9LF0vNZkJId3Zu9RsLWMs1r6GOLsFnaw78WIAYx6ZA3qFVKNVvaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzvVrkCLB9wUcYedQjHVar7RcrDxXpbeL3yVRbffTBQ9wt/CSo
	99d/W9NOu3jg762Ytu+MTd5x3Gt+zI/pyGchNknVvgL3Ih8mzo0x7izxWcaBpZqCj0PxK0WKN5H
	/cnh9ohnAjlaL9TrCH8VZNA5UFvpBJWufMPKp/WG/
X-Gm-Gg: ATEYQzze9JurOssb+Za/B3RckPM6LFG4ipey1Ht74mF3zpLs4yN3a+0JrROahoZxC50
	3mndg8AoQSLV6XZnw/BS3uNxEjQ1JOrVPZUugANhHTZq7iz0qw2EihwcU0LBmEqk7cCLnjF6err
	XwnNpappbsGalCv9CflzL8jcgGST0gPt8C15QOgTYLuJLtGOcmU+y8dGNpRSe74vB0bQwLhEFpJ
	Pzr6f+CC/JUap3PV60jMUgnucCffNoTLImu8tiNy0orf7YEV4pAjOiCFtmto+a/KYm3mnPTBSfO
	gogB5z0Pavo7IXKuqiV0CokZp7j6+v1XcvShUtuRf0tdtVnv9H4=
X-Received: by 2002:a05:6214:2467:b0:899:fb4e:47a0 with SMTP id
 6a1803df08f44-899fb4e4cfdmr83390516d6.60.1772500625509; Mon, 02 Mar 2026
 17:17:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303010340.306164-1-elsk@google.com>
In-Reply-To: <20260303010340.306164-1-elsk@google.com>
From: "Hong, Yifan" <elsk@google.com>
Date: Mon, 2 Mar 2026 17:16:29 -0800
X-Gm-Features: AaiRm50kBLMCph6UcF6rktRMuwcn4MiSh3q7HNeIL-naxqDFnhMYS_CXzj39k8A
Message-ID: <CAABy=s1DvQpq5O0WDH-OV+6=fCxcAH=zaKSKXYwAwZUB9yNQuw@mail.gmail.com>
Subject: Re: [PATCH v1] objtool: HAVE_XXHASH test uses HOSTCFLAGS.
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: AD9171E7965
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11527-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elsk@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 5:03=E2=80=AFPM HONG Yifan <elsk@google.com> wrote:
>
> Previously, HAVE_XXHASH is tested by invoking HOSTCC without HOSTCFLAGS.
>
> Consider the following scenario:
>
> - The host machine has libxxhash installed
> - We build the kernel with HOSTCFLAGS containing a --sysroot that does
>   not have xxhash.h (for hermetic builds)
>
> In this case, HAVE_XXHASH is set to y, but when it builds objtool with
> HOSTCFLAGS, because the --sysroot does not contain xxhash.h, the
> following error is raised:
>
> <...>/common/tools/objtool/include/objtool/checksum_types.h:12:10: fatal =
error: 'xxhash.h' file not found
>    12 | #include <xxhash.h>
>       |          ^~~~~~~~~~
>
> To resolve the error, we test HAVE_XXHASH by invoking HOSTCC with
> HOSTCFLAGS.
>
> Signed-off-by: HONG Yifan <elsk@google.com>
> ---
>  tools/objtool/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index 6964175abdfd..b8b8529f8ea9 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -13,7 +13,7 @@ endif
>
>  ifeq ($(ARCH_HAS_KLP),y)
>         HAVE_XXHASH =3D $(shell printf "$(pound)include <xxhash.h>\nXXH3_=
state_t *state;int main() {}" | \
> -                     $(HOSTCC) -xc - -o /dev/null -lxxhash 2> /dev/null =
&& echo y || echo n)
> +                     $(HOSTCC) $(HOSTCFLAGS) -xc - -o /dev/null -lxxhash=
 2> /dev/null && echo y || echo n)
>         ifeq ($(HAVE_XXHASH),y)
>                 BUILD_KLP        :=3D y
>                 LIBXXHASH_CFLAGS :=3D $(shell $(HOSTPKG_CONFIG) libxxhash=
 --cflags 2>/dev/null) \
> --
> 2.53.0.473.g4a7958ca14-goog
>

Sorry, I forgot to cc linux-kbuild@vger.kernel.org as well. Adding
now. The original patch is at
https://lore.kernel.org/lkml/20260303010340.306164-1-elsk@google.com

