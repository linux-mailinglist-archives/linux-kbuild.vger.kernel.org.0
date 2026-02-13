Return-Path: <linux-kbuild+bounces-11305-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6N91F7Zgj2nNQgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11305-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 18:34:46 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D3E138ADE
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 18:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05DC0303AA99
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 17:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A02027281E;
	Fri, 13 Feb 2026 17:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4kZi3Hy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFC926FDBF
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Feb 2026 17:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771004070; cv=pass; b=F9g1oP/IYQ5B1ZCg2w+b7BJBcGI871Ri//kowpt+gYnw88oOpIJI7zevjPvwmsarWd+SIOzUJKFwctYwso2mOaxxkfwSlL+KgrlCfMFbXMIXJtZdFIwbYjLyzn3UehBbWd/ZooY+qv7avCtGtLQYQVAcGwOCTSHwhiJZ9aF3yfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771004070; c=relaxed/simple;
	bh=nIhERrl+/6suf9bReXI5bkMmHJHcG8yyweVsM7E+Vss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9i+jpmeyzTtG/RWCmj3tQWfhDSjPrC+ZtVzUbMq0nN9cNuAz+pgYa/AD47tpDcaKtMgMBdhBHrusPb5QwbPRCh3ym1oeGM8MKNhwIhHLn9GeN/6GTjWRe6NEQZLfQJgBvyzgnlOrW9Msxj3WjJAjcTXTQHdjohdh0DO4rymWhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4kZi3Hy; arc=pass smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-896f4627dffso17546146d6.0
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Feb 2026 09:34:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771004068; cv=none;
        d=google.com; s=arc-20240605;
        b=Synbnm3heKLJwiTIlwRblWX4U6/V2I+nLRGc/DqWYz9V3WHZ1HBxO5N/i2Rn4BKEfl
         gqiZ5NNprg1eZZEWVWwqKW+TRayIed3VWW7iuzsCV1Ok/MDk+POANhv5A0to9qPwF/jB
         ZkNKhDQIoNrUmTmu0Sm9wMrSSCophc8KH5JEDzsA9TBS+7TY/szqQaHFzYfVjjJz04Fn
         LV8d1uxCOXTu1GQ4VJ2sCLftgTtcU1svAIvKoiughL/EQezrjlVYmV06K0Q8Sbo7gHsF
         QuCE65/WysQCpiR/V+SyGP9+wKDray9jTx5yMdkCFdCiuJ9Wa2lS/URqgxo4pLIK8eOR
         wFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4yvhP1H7yHsZiLOV9ztUW3AB5Dd0c5ghQQ4/diRvLxY=;
        fh=Qips7xiEAMtuzEMztUP11NCJ8KocyrSb+ErxTWD8rdg=;
        b=F+R87aVM+axE3N5/MEqWxMTa0ChyaLIObBlkFVLvODPalbaWEFcDdHg+oX+nzxlZyH
         h9Hbje7CrjZKi5178sx96d9m9py+Hdh4uVO1y0PRWSPDTs9Xv479yepCXWk4l9Fv0PWS
         /v2/T3qe7bLh4qGJx8Bf2FG+LV9DqRqKC6n4oBEqpAqiHkXxSjgdb8ga6fxjHVCcYXy1
         FuxMD/lTXeLPSIR9KFPsUHoySo2uS5kMvoJcCbJVZBKnf4JijUYZtoAHgeUsJKAFmdl6
         izsfFnADr4co7CT35n4mQnJeYf4agRjzfoqD8XXNoOpEl0QaKAguXFnBF9MZGiBCnAI5
         qnOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771004068; x=1771608868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yvhP1H7yHsZiLOV9ztUW3AB5Dd0c5ghQQ4/diRvLxY=;
        b=N4kZi3HybwtA6g+06hp2R8jbWCVDrK1T+i7Ipn+ClNXv2qq+QzYAuVd5MTnTrRmRzR
         k4p8rG5Cvg5CIye8K4YySTGOdhrp1+XOc4TK6fst09PgXAfuF5/d1hwavPwIN6NaIaLp
         buaRjWAYqzxqR0En37VnEjcwFgq4lLE1/KAgL5CkvU1rBGyaSv6ooCA8tuPCsq0u/2tI
         Q+16Nlki+96jXDWjI4H+Yp3RxgQbJwoEFzJxKqKb2aS3jsMsl9JtAUf5GGqmClp9StYP
         /hxSMK7RVAVI6i2+e8Zo7T7hi/cqz6XyPTB0ZWhCw6wSVF0YoE2jeiOm7aYLKKxKIdpF
         Hs7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771004068; x=1771608868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4yvhP1H7yHsZiLOV9ztUW3AB5Dd0c5ghQQ4/diRvLxY=;
        b=dz3sqhEZiqM2Nh8BB1ul4AVEzux8tQa308EuQCp6oYahTZTNbamaK5huCR2rWlDksS
         YFVHzzGjXva41NYi8P/Gpg2D1IMxwYJPdhi/psefuO0AXUcHMhxDEggCM22GwKHrywy3
         9VaQdtbY9UzPFetf7Go2cRWMqoRcZGx+6RIzR3E+zvDIrhnhiMYgDykZgXx+4CUflEkz
         ZeFW8KJ19qGmfrFZ+gQRy9wVSp32IHcEEpzWgN/7plTCZBmZIsXlH7/mzKkl7E7gXH8n
         Ut+85VHBnrm6GbIJVU+eGWOSjM/q/eQ1Q10Vo8AQuchcASka7Scm0erKg7ArXYhPafvU
         x1Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWClFqXaP9vwS5QfSgBVe969w9vf0WUoebAJvj2pIM/AxgBBD0Y6mAsqsmLEcbZ4cuepXHySjhz9gPiABc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsbfzOEoNl5doPSK+ARR0ir9c9HvxmQiLJg++n8RBD0Ao8l5My
	JM227h9tLuCI6VFruXRaFi9+ntUA9+SfQ4zLG5GSxHEgdQ9jST8P9mJbdYIv6N+x/yHlNzjBtiE
	QcYgwmg8sQEAf6b33t2p3szHIBkJarSs=
X-Gm-Gg: AZuq6aL7BOWeayRMkMpSulChZaFMXZZR1E5rDai+Hs0m99E4At4rniTrbEHPpzevtq9
	ODGAQjiEr2BGRyuK30wy3Em7duj6zZwTneYKp5500/ArawdDp5f70vnYsxmEFWPEPqYKMYTL3KI
	ZYvoEt0uoWoEdbkDHz5HVFxY76ZaFg1nXIXSYFRi8cZmfqTlJZF7yAu0OwNZg1fUnTRQ1G/fEen
	Xa/2q6ru6v2YTKeT7ciLb4PYB7MVDOkrLblJ1oGsqNvxgbmpltDRigqJuiNPTm99l09YNrWcT5L
	hH7nbAof5Ct+Wx+/L5l5sRpgEqqWHAbbp+dZ73PAIylBUO49GBrVVJwP5CoCWRAxEzJZp7fyt2m
	gbE+btxDkMJfVsnHefp2GT7Q6x505MPyzLTmxVyAbZ1wfnf4OReU79386SQuDntGKG+RKn+VTSA
	==
X-Received: by 2002:a05:6214:1c0a:b0:896:f9c7:a833 with SMTP id
 6a1803df08f44-8973606eaa8mr33561156d6.12.1771004067962; Fri, 13 Feb 2026
 09:34:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210-kbuild-fix-debuginfo-rpm-v1-0-0730b92b14bc@kernel.org> <aY8wyR572eZYWVJY@sgarzare-redhat>
In-Reply-To: <aY8wyR572eZYWVJY@sgarzare-redhat>
From: Steve French <smfrench@gmail.com>
Date: Fri, 13 Feb 2026 11:34:16 -0600
X-Gm-Features: AZwV_QiOcHxyXHosuJrWmnZirG4ujnDxFjrIXSXPyoAT82XMAIdRgLRxgC8uN-Q
Message-ID: <CAH2r5mtRZdQfdBBVZBaiL0MiEA7DWkczYMafiDaEBSby5RxK7Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] kbuild: rpm-pkg: Address -debuginfo build regression
 with RPM < 4.20.0
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
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
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11305-lists,linux-kbuild=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[smfrench@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,find-debuginfo.sh:url]
X-Rspamd-Queue-Id: B5D3E138ADE
X-Rspamd-Action: no action

Can also add Tested-by: Steve French <stfrench@microsoft.com>

On Fri, Feb 13, 2026 at 8:11=E2=80=AFAM Stefano Garzarella <sgarzare@redhat=
.com> wrote:
>
> On Tue, Feb 10, 2026 at 12:04:47AM -0700, Nathan Chancellor wrote:
> >Steve reported a build issue with commit 62089b804895 ("kbuild: rpm-pkg:
> >Generate debuginfo package manually") on RHEL9, which has an older
> >version of RPM than what I tested. Turns out that RPM 4.20.0 fixed an
> >issue with specifying %files for a -debuginfo subpackage.
> >
> >The first patch restricts the new -debuginfo package generation process
> >to CONFIG_MODULE_SIG=3Dy and RPM >=3D 4.20.0 to ensure it is actually
> >necessary and working. The second patch restores the original -debuginfo
> >package generation process from commit a7c699d090a1 ("kbuild: rpm-pkg:
> >build a debuginfo RPM") when CONFIG_MODULE_SIG is disabled to keep the
> >-debuginfo package around for older versions of RPM.
>
> Yeah, I had similar issue on Fedora 42 (RPM version 4.20.1) and this
> series fixed my issue.
>
> >
> >---
> >Nathan Chancellor (2):
> >      kbuild: rpm-pkg: Restrict manual debug package creation
> >      kernel: rpm-pkg: Restore find-debuginfo.sh approach to -debuginfo =
package
> >
> > scripts/package/kernel.spec | 57 ++++++++++++++++++++++++++++++++++++++=
+------
> > scripts/package/mkspec      | 38 +++++++++++++++++++++++++++---
> > 2 files changed, 85 insertions(+), 10 deletions(-)
> >---
> >base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> >change-id: 20260209-kbuild-fix-debuginfo-rpm-718f81dbcaa6
>
> Tested-by: Stefano Garzarella <sgarzare@redhat.com>
>
> Thanks,
> Stefano
>


--=20
Thanks,

Steve

