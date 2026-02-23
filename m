Return-Path: <linux-kbuild+bounces-11375-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHp1NxjKnGlHKQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11375-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Feb 2026 22:43:52 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D2C17DB01
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Feb 2026 22:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D6C1303DA96
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Feb 2026 21:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B59378D9D;
	Mon, 23 Feb 2026 21:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mR/KjGM2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AAA33A9CB
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Feb 2026 21:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771882905; cv=pass; b=jYkkZhDHDwpmOJs3hY/bbL7mXPVZJNwTGtHP3R1JZSBq76x+F78a58zg/xwv5zb1YbmI6Rj3/WCZ7CpuKfmS/BDzNZ9wASvQt8LU3M9VdMyh1prN8Bfjb7pBwoNelzurMj7wwB2KdgM7pmoAb8E7EVBt3D38CQbbjOtR3AHcrio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771882905; c=relaxed/simple;
	bh=1JG2cynNzhGyhQW47nj1rwIOUkkhTWpJb7I8OtRgOjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XvMRExQ7KYze5/4Ou55IWKlWVBaqSvBfZ6zsedACaPLaIPoHzfZMtBrfwXPPpdaY2cJ62QINcgOjKiQK/JA22jxr059uTMnfj7XoEfyos7mD28x/918tYqKl0cX6oxmSO3NKN0/iUNXK/tVP3mhBq7BBOrBjdOJt7sQo3ikj2Xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mR/KjGM2; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64ad79dfb6eso4702939d50.0
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Feb 2026 13:41:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771882903; cv=none;
        d=google.com; s=arc-20240605;
        b=j8ZoxtUmegyE9VzyhxAfqo1npZXfSjU1DPNkgts1jkrKGQ5Q6yfeGTzWvMdoSKPdkb
         ATYL81LyC/dJZ9lD7dT72jVLEB4/UAI5HoKIxyRLjIMN6QnSao3CQHjOCjkRNdtDsiC0
         QraWS1TLrKlaqaeMTM4zuKbKRJa0cocwVSTuLgte14GVRbDzgOD0JUZlgb5aIKd0a1EG
         B7KnPinVzbedNc2Dd1xcWcfEgmtAdj2Nx6+8CohRdvnrpI/JvYiyb7cBI4YsHNkDZtRF
         1CXcY/5tU86H8zVk6zLKw4S/4TQpHsEDJwjoNDvA1hXkI0b00SLhGD9YIz+ayTCMRbM0
         qImg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1JG2cynNzhGyhQW47nj1rwIOUkkhTWpJb7I8OtRgOjo=;
        fh=t46OyGyVZsPgMDYe1LkFCkp5PW4+auxvYrEO2MfSihg=;
        b=ezVNRfUCEqkprivr5Zptrn8FC6IbzXUIpy5Annyqnn8g0rDJ14tF80QjgCnuWvEcV5
         rpBOodhFUdcS5PKVf4AAUnkKvm1wiM7A5fwKIfk6ocsEriVdWjZQlkrN4cDzGX4W7jnR
         uCvCBEtCn046ff/xQI+BO7pMr7nY3WfJFwWI6QFrJlm1KInND+o+03Po+HFF+YO5FHV0
         clznkHD8woiwowC0ndZ9mvvY45odlSfdOU8+cUwjIDX61tY46/iAVXssXxdDMxOQtkXx
         zwbp1q6/iy/nGnMXFTGmckRoujjwsMWmDtt9BIGqG5vrL+UnTU2cjJsIayGfMt98hIYn
         t5dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771882903; x=1772487703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JG2cynNzhGyhQW47nj1rwIOUkkhTWpJb7I8OtRgOjo=;
        b=mR/KjGM2e1PoabVLs/GloteJgAksAVkDI8QYaZN3u/WSycdLe1qJsALkq8LIuz6X1a
         rRM/Xr4WKXvciPRlqCxUf99PgvoZ9LBE7Deik3xsE3MVoGz10lPjpyHrKodJL60XT5ss
         4z2i+JAP5z830gB/43N2hP8op3xluX8BUsilz9oKrA1qDE+5ooIIa639vIX9Af6KccUq
         kmfftViRVrRcZdDMTcSEfeYgGtWl3Q/4+7Ft8mfVPkJ5d97RKsHpGwoROshuap45Jm//
         dIeB5C+/It5H8vESVY10A5vvW6t2AMoWtVE3Yadcjyc8eciah27PTSgk6CZoXjzJ4Ynp
         bBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771882903; x=1772487703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1JG2cynNzhGyhQW47nj1rwIOUkkhTWpJb7I8OtRgOjo=;
        b=Me1x6o4w6O2zaVHpd3of/1PiV7p80x5ppE/3InmNAl176DvbPBxH3yA63AJAKuAPTu
         ajFA4A+9U47R+AghGes6UHEvV5M9YTfFF2jiahidIUg7/vU0oWY7uG1syUkeA9TitbW9
         yu/G0ilTdlnGJsNWr22eey4ZottYkzhP3EKINFk2+WSbsjxX5FlhXqD+CE00rDC8gW6t
         xU/JCon+jQKsck5ycFk3gst3oxQD46jyYT2F3MIoArUFQYqMz8Zr3XpUZSk5Y45WuIed
         W/X6njqXO2JHR2UgvNqW5PGGe2M5VEeckmaYACXoqMvbi9dLjZAMjztPbr42gQhH9BGe
         R0Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXSo0YDUG1z0Yhg/MRykRjusnwNxZ7NmA3jwVR8R6x+88cDUkykBnk6yuXKDX9R5SQgtlCrAx3HdYThzZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzeInJr7/mOo27/GYJaWxdUAWsDneu7PdfhQgAllHAhGlLokX4
	6H2l/T5cveZOH1o0F4JhFgYg4mIa0wavbQmberlb+F4R+1dCFoGQzFu0vNyYb++Kizs4MNULZUR
	Mlb0/NLisZ11nRzXCINFE7IlHUlFELHs=
X-Gm-Gg: ATEYQzzqKnOcwvlpAGdGNBwI2hmmBbq5IUom6glrWcd2aiHNj2Twi4gyUqKRdTqSTqY
	SJ8EIUVubftZRALC5fFcUm/qWW2ZUEXOFVY36dHoLmiD/6uqhqbD03MdtP7KFBzDdFoKezN9CNN
	s/mmAqQBJh/7UP/T29xtQ4yTaBIKsifOTvr/xacOZ2qgNXMOfT+YUw05TRA/sM6gNv9Im3MIPnb
	WG4Sr7E4EV6jvKL+bHN3SgzyvacNHhQaXVzjQAmKYZNyYNYnFc3juC/3ZuXaebzgOTRrCsTLpV6
	eMzLkXU=
X-Received: by 2002:a05:690e:134b:b0:64a:d67a:1fdc with SMTP id
 956f58d0204a3-64c785dc781mr9063433d50.13.1771882903527; Mon, 23 Feb 2026
 13:41:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220105913.4b62e124.ddiss@suse.de> <20260220191150.244006-1-safinaskar@gmail.com>
 <20260223121946.45b3c5b1.ddiss@suse.de>
In-Reply-To: <20260223121946.45b3c5b1.ddiss@suse.de>
From: Askar Safin <safinaskar@gmail.com>
Date: Tue, 24 Feb 2026 00:41:07 +0300
X-Gm-Features: AaiRm53G7mBkRTZxrmFx_UAZ2LIC8h6oVUqyUREBRtA1_T72X2Ms5uG-DS2L9PQ
Message-ID: <CAPnZJGC0kHEmAqHeTXwbcmuA0GqEOhDmCfjLRPRKff5DsEgW6w@mail.gmail.com>
Subject: Re: [PATCH 1/2] init: ensure that /dev/console is (nearly) always
 available in initramfs
To: David Disseldorp <ddiss@suse.de>
Cc: brauner@kernel.org, initramfs@vger.kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nathan@kernel.org, nsc@kernel.org, 
	patches@lists.linux.dev, rdunlap@infradead.org, rob@landley.net, 
	viro@zeniv.linux.org.uk
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
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11375-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.de:email]
X-Rspamd-Queue-Id: 34D2C17DB01
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 4:20=E2=80=AFAM David Disseldorp <ddiss@suse.de> wr=
ote:
> There are still other options:
> - use a different initramfs archiving tool

I'm trying to solve Rob's use case. He tries to write a tool for building
kernel and rootfs called "mkroot". The tool is written in pure shell
without any C. It should not have any external dependencies.
So it cannot depend on a custom cpio tool. The only cpio tools
allowed are gen_init_cpio and whatever cpio is present on the system.

> - point GNU cpio at an existing /dev/console

This will not work if we are inside some container, such as docker.
Container engines usually replace /dev/console with something else.

> or call mknod as root

mkroot should work as normal user

> I remain unconvinced

I still believe in my approach.

According to current kernel logic, /dev/console
magically works if you use external initramfs and doesn't work
if you use internal initramfs. I simply propose to make internal
initramfs work, too.

> To me it still feels like a workaround for GNU
> cpio's poor archive-contents-must-exist-locally interface.

I will repeat: mkroot should work not only with GNU cpio,
but with whatever cpio is present on the system.

So we should either fix *all* cpio implementations, or
fix the kernel. Obviously the second option is easier.

--=20
Askar Safin

