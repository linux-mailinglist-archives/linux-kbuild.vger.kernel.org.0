Return-Path: <linux-kbuild+bounces-13139-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGyjIDehBGqbMAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13139-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 18:05:11 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CC9536BA5
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 18:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58983319A40F
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 15:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F36495520;
	Wed, 13 May 2026 15:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3YYctmR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCC14BCACB
	for <linux-kbuild@vger.kernel.org>; Wed, 13 May 2026 15:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687576; cv=pass; b=O+1yVVu+3V6WRjUPlSS1J1tKoyMs3d8jlKEXR7peyKQK5C5j+c/qQ8t/eqjDehnOOtH6LBR8mFMWXy4JJvJW4k6/1ddKGoIm+4+/Wp1AmUNqzbmNnRF9DfRc0YD1SqqVxdmERD4M3RVxF0sL+y5FXCybE1IAviOzzsFaa5A72Kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687576; c=relaxed/simple;
	bh=zASBe7ByZeLu0hE+izBfltpFmuYzTuAbAv8KqHgRt6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZAv8EYuF8vCcwDZwyIyQ05mjV8iD9Qags8edRc+TpfJfeTUt58G1lL675asulx3yec3+VkNNFNL+1RAiaSX83yC0paJDwwTt72WM0MJZa4nWClhgqv6GdsLrgX1CXUt/8WBEzsHk7CeHLgG4fqPpgnaHRP/QjEPh59d5Tvqzkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3YYctmR; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2f0f13b7c1eso332395eec.0
        for <linux-kbuild@vger.kernel.org>; Wed, 13 May 2026 08:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778687574; cv=none;
        d=google.com; s=arc-20240605;
        b=AW52iqieTX2SO/VkPLrHzH6HavXIccy4J0P9tTZfjueFPF8VEaSR7XjTnSub2sw+TY
         MUCWgieTK5uJDlfl+BLZvkIYHDP92qCuyydauLRyr6yazbWFBJT+NoUZWEKY5SWIL8hG
         2NSUiyT5/8qnoNxQ0HXRF9VDharoidEbzwvUjWtdiFl7M0RazcwKf5Fi0f4EDz0Yw01M
         cR9V+6zj29xUsFpofZn+IF0krxKdCx+880C6uUhCtkEn1gDFgs6i5rfV50/WouAWGywB
         +0B+82h1P2sZotgDlEjv2cpiGZgtbuKgQXSvKAmBPcU8mWL+B2p8JSNMvc+uW7xUDnBi
         jzog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zASBe7ByZeLu0hE+izBfltpFmuYzTuAbAv8KqHgRt6g=;
        fh=R1697puPHftRaYVkky9ZDoKV5iX1BSQqSt6rEMXuUZU=;
        b=NEL14eVOnA2HZl5DOvZlQa34DIczYx23TBhFBl5CvdsQAZaQp9qePAGYg4M3mlZ7Q4
         UvokJQHghkdaJ6ngu/beUOaoSZ3bIuLytvlc8FjwNnQSk03+NdGYIwxgdEVxjfEeQMdu
         ziSi3287SHurTp9W+9zPIzMUFRryZxCnxa6EE3Kp3gzpk1oGDewJshwLXug1Q6ZwlGB9
         VsPny/2uoCAloBeTJ4m5QyX42+P7eEHHZUeED87vzkXgh3xDjoYjCERTbgVtPPTwFxJk
         tYKfFkUIlaZidx6a05AeJnZzPKmf4KB4qbTYl3hCg+371RN7A7g9B5+MC1Utv+IaihiB
         vp4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778687574; x=1779292374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zASBe7ByZeLu0hE+izBfltpFmuYzTuAbAv8KqHgRt6g=;
        b=b3YYctmRjLeTnMhENHoZ7fJ4dEn2jjGSn4fB4hht63P3d4CDJEkwNIp2lCXZlEZBxx
         hygo2jTJqN8ZItU6TNXU21Ov5UZpt/swvWHiSN07zj9M2rZPmNJl4/j9Jx9YC0CQhhug
         14VHOnW/6SH0q03ju94DHq1C6OPWoPbFBWD0/1ELz3/ysT8yjevxgx2HZsnrXEtHs0Rr
         zye7NpEL7nAJ+ZtadsBRzkWDFclDnozWcFUiLxR1lTwvjdLjH1YhzZRIfCbjbUnDvBb4
         dI1wJbz4SMiDmmN6/bOKg52yrSM8Bj2B/ZUKVw5sx0f6ti1dQuHNT4sNiOEQqHzdlMLG
         7dfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778687574; x=1779292374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zASBe7ByZeLu0hE+izBfltpFmuYzTuAbAv8KqHgRt6g=;
        b=mHEjqDSOyM0gkb7UgGyiKHdROUiapL3MIoef5hdmJ5O87odbTJXI7sVAsk6A1Fsp7k
         hFMvW01tkCjT1Nkla0M99S1YbSy29skZl+So1RAgm1zntIud0j6dKBDcAHB00B0nhlER
         l0bEvt93AIOjfD1z8QdGFAoPVLIAGA6L8a58s92vzjVppH8p6j5Gd9Rj5nx4WAGVyPVL
         0Me8PAieVa2BFZ3YyM602f3wuQnR6HyIzZGWH3S77Xk1SyFLeRkRtPxj3c4tK/bb9COE
         E2Aqm4de/yE5EzT0k7z4M2ukfM2wI6wVsvoRcPaCZAnlT05hK6MuGbcdcVUTSv33MLof
         PEjQ==
X-Forwarded-Encrypted: i=1; AFNElJ8LuLfv1vavVrCj3NiRhISMGjAub6mcFCBV5LAiAz9jdTpz6OzYy3ueDnPiXIMxovgS/txsKYtBMi4NbBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmqaZIVFx5cREdqh97GEagK/FLj7WaREstVt+P+5wBw0Uubqi8
	yHpPTZl9oH9TFCY0snQqSG+ir9LoLpP+aq24cNdY7/2WoConWOi/tgF6vC7yXenUumSDwvbXDg+
	KWbqk8DPG8w8OwaDdG4bbwWfA6U3V+6M=
X-Gm-Gg: Acq92OEvv9+swM+YgHWhoXdz776qNBEJLcTaEAkTbFBQw29VHRdxoWMM8dkJABjt2z3
	GZIZ+eXpr+HtjinyAYOFJYW2RjdPUFmFdfU3wnTY7et8b8Pg6B4y98rj/bNRvRxmzJ9VGBC48fZ
	EcF+lK1iIcT0kDbxHHAaLd39fkSnpEQuMAK8uuHjwUScV04rFlfxwCTXgq/17ak1M0wMQtr1AQh
	DCyE22dVd3hAFeUIl+8DEj/RtV7ybYUA7i4CAoUB+lwuWpIm9imk5BpV25Z7rquwERyG9Impw4Z
	4nzzGCwWZKz/V0qqVT1ixAmU2To0dzCdfIStjA4TecrTluD3xm/jCDILooss0hPUwkB1wkOu7aU
	u/hxssPzQp7T7vSDrtPa9z3o=
X-Received: by 2002:a05:7301:290d:b0:2cb:8d2f:e235 with SMTP id
 5a478bee46e88-30117085553mr1095439eec.1.1778687574140; Wed, 13 May 2026
 08:52:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509203808.1142311-1-julianbraha@gmail.com>
 <q02rn6o5-5pr6-1744-6os9-1052roro79s8@vanv.qr> <CANiq72kUD=s7VkOUBNFLbcASvDoO_qFXHziOcSFdDqtg5NXoUw@mail.gmail.com>
 <5220poq2-qq9p-27p0-3sq9-50q1845n76n0@vanv.qr>
In-Reply-To: <5220poq2-qq9p-27p0-3sq9-50q1845n76n0@vanv.qr>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 May 2026 17:52:41 +0200
X-Gm-Features: AVHnY4IGMOl_bQlWYRPsiusXrrcSAS_I2ISamEAFUJAQs39YxFfM6FwhNGHVvT8
Message-ID: <CANiq72=QahBNGuwx8H9kA9HYijMi+H3RmZ6B8YS_UrFy6xW7Vg@mail.gmail.com>
Subject: Re: [RFC v2 0/2] add kconfirm
To: Jan Engelhardt <ej@inai.de>
Cc: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org, 
	jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net, 
	ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	qingfang.deng@linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 17CC9536BA5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13139-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,linux-foundation.org,garyguo.net,arndb.de,linuxfoundation.org,lwn.net,linux.dev,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,inai.de:email]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 1:28=E2=80=AFAM Jan Engelhardt <ej@inai.de> wrote:
>
> Linux, and many other projects, have run on a "The system version is
> king" model for a long time. If libelf, binutils, gcc, libx11, or
> whatever the dependency in question may be, the project trying to use
> a dependency would add a few-liner patch to broaden the accepted
> range, rather than trying to re-provide the dependency as a whole.

Definitely! It is why I mentioned "even better", i.e. if it can be
done using system packages across a reasonable amount of
distributions, then that should be the approach. However, sometimes
that may not be as easy as it is with very well established (and
stable) C libraries/APIs.

Cheers,
Miguel

