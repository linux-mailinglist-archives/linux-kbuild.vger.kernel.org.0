Return-Path: <linux-kbuild+bounces-13175-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG8RIu0ZCGpLZQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13175-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 May 2026 09:17:01 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F05F755A94D
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 May 2026 09:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BA643013B64
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 May 2026 07:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791CA282F3E;
	Sat, 16 May 2026 07:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nY0950/p"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADF9292B44
	for <linux-kbuild@vger.kernel.org>; Sat, 16 May 2026 07:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778915818; cv=none; b=OO/cyXjDDvLWgOvB/xnNEwpXUzsFIs+4wAzZglf6eTR/I5tBTvMoVlT/sYV34MIlJP/oou51BqnbmdkLX28qULzkxH/krnYRaTV6QFL3R+O4JoEMc/hFJnzW9EOP6ePgjbe+4JeHPkDyuycMqToy/Ql5QdwRawnzsa6ytgwvrHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778915818; c=relaxed/simple;
	bh=nJ66y5Bfh+93qEmuK5iM9AC195GkqDNSRX/ut4Y1SQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V3xj7I0eBE0aBUvB8/y91KJ077IC72Im47FdTlEzV2ssW8JsDtkkPAm2QWRGuMbEyCZe4Xx9olbtcDF74Z1aBNCJoEmcl9B8iUfwMWowNdc0S8XjzNJEpJLNlKf620CkNsNONyaaQG0iGs8t4X1HVXOGkqfspNKFlB6Cy7O55y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nY0950/p; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3680540a6efso249694a91.2
        for <linux-kbuild@vger.kernel.org>; Sat, 16 May 2026 00:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778915816; x=1779520616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nJ66y5Bfh+93qEmuK5iM9AC195GkqDNSRX/ut4Y1SQI=;
        b=nY0950/pgIPb5KtKagTJQZ9U6GHLJDqoU21mrcix+UnJR8Cone0AeLerQuO+AYm9LF
         NJRN1vHCLJZfICVZCuTpWSU+5eRLa8EeSfiNuokEAPVgv1t0XNeyDXY74WC7JYJqdhGi
         XA/aXzA4NnC0KiPu0gKvXnBh4Of66uYA64E7tlYUixl+9dsNBInyJj2ud1njFYsZc/XX
         HX0QosObv+53/EtBSeTt4KvsnbDdquql9APH+jiYNrK+w+AMo0/9cEV+5Fb03Ad44gyZ
         xjEukCUZ1jQl+q1oTbX39rfatZ97StcVamHoTwrrqu8VyNDUDr4c4sYT8rICe8MHGp8h
         7fdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778915816; x=1779520616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJ66y5Bfh+93qEmuK5iM9AC195GkqDNSRX/ut4Y1SQI=;
        b=ZfjsAs9uadErsJdAh0GZQzBTXzzRQX3vppcae1tmXhCaKpLCosVF/phNWOhAMcGoEU
         GVexkD9q1G+u5pUYjUcR+yQbD2MIeAyanPj1CoGB88daIZPGyMtzb3MJ2osX+0HfboVH
         sCxomO0strzi15yS6bPfztMx3wwaS3yekPNB98weAlRwUAFaD91s0ICy9Mvy+knvCIue
         3705wyAPYJ3fprq94chLLVy+Ak7jPxzeED7+MdqKlx0hItg+tOkcCi3U9lT0J4hWxwpn
         9XQI3LzUrjNHti1R9bFLsHRFy99huH16hSuTJ7DMWe7XEVxm9VlrmCjEMsLjJst0pLdM
         bnKw==
X-Forwarded-Encrypted: i=1; AFNElJ8WR1ba8LH1fiM215zAX1+OeMflgmArk4Lun6MUdwM3WVris/HsPoPYXEO/vT+8lhtf1fsgDOFe1BiapKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgR56e5UgiY3sOu2eDwUQTqKX3utOfVUFJ5g4dGr2As+xw9hZe
	Ab6iV4jf13Z5dVg3SJYN84H6ac25JMqoxYHyDMoMNU/QPBiZAvtg1GjR
X-Gm-Gg: Acq92OGgTtnPzc44ts8jYI0NZoFNxnGXmkZKEh+m+QA6H7SUlI3+sJ0eqcjQrvcc0kN
	FaIW9QyypZGklv/lZG+s/0olr9n/f59Hjm+LrdAdFbm8kA4somtKaJOaMHbiUKDcVTccoA00zVd
	mJZwm8/xz+C//CAdSrKMW3rIPa6TitWSZJSxjvDZ6av6+Zsa75dV8IOrGtnmU1lRGmdGwTt1F+F
	Ty4XEDQPKdVsw2cErKcjxyrL0T8Fqh9ZJhXAJ8Ze3/ON5bIpG64JJvs0R7EOq+3VpXE34rarVdG
	AAst2gyrb2M6JTPsBlHXCY8r9fFUKq3ve5Z5beVdk9m27nFrnmAxL57Ef+UbRVm+8uxC+1zVRmc
	lTHIMGF2p8tQ/yKv3nR7Nkz7NrHP0WpNFzdJbOvKaNbnlA+lVN7rKlR6oTsTxMjZKr5BG8o2O+x
	rQ5zc3VAPVcBU16fDTrk2hjGN7RxGTJBiiNDw7lg5/BZYmFBmgnZl9zX4Qp7xf3Kk/4C8mKW8xf
	GwU
X-Received: by 2002:a17:90b:35c8:b0:356:22ef:57ba with SMTP id 98e67ed59e1d1-369518b669amr7502144a91.7.1778915816332;
        Sat, 16 May 2026 00:16:56 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c1:201e:affc:fc39:8ab8:bea7:27e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3696e24e857sm1028945a91.0.2026.05.16.00.16.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 16 May 2026 00:16:55 -0700 (PDT)
From: Jill Ravaliya <jillravaliya@gmail.com>
To: nathan@kernel.org
Cc: Jill Ravaliya <jillravaliya@gmail.com>,
	nsc@kernel.org,
	masahiroy@kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: propagate hook script failures in builddeb
Date: Sat, 16 May 2026 12:45:44 +0530
Message-ID: <20260516071643.23179-1-jillravaliya@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F05F755A94D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FAKE_REPLY(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13175-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jillravaliya@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action

Hi Nathan, Nicolas,

You are correct. I tested locally and confirmed that
set -e in the generated postinst does catch run-parts
failures even in the && expression — execution does
not reach exit 0 when run-parts fails.

My patch is therefore redundant. I am withdrawing it.

The root cause remains 55-initrd.install silently
returning exit 0 when initrd is missing (LP#2141741),
which run-parts sees as success. That is where the
fix belongs.

This was my first patch to the kernel mailing list.
I apologize for the noise and thank you both for
taking the time to review it carefully.

Jill Ravaliya

