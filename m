Return-Path: <linux-kbuild+bounces-13469-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JT4LqORHmodlAkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13469-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 10:17:39 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBFB62A5E1
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 10:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 724213012B15
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 08:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017E137CD28;
	Tue,  2 Jun 2026 08:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiuOTSup"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D0136AB44
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jun 2026 08:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388172; cv=pass; b=GVu+en0RQznotbpTtuHRrxcLuea6UXclNtgIa36aOJptCea821zYTY9GL5z0IEztNXd8GczJz4zvMS+T+SdzFYeEF2jwHrEWgyGZzQe4qUeIPtsUYLmCbqG4Q2+NQkMp+gSfyJ8TT3gKDblttCsuzK/obRez7iHTaZOfVUzxEek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388172; c=relaxed/simple;
	bh=vPW8wLW+xTLNb8dxBfNISJORukiYVfndRQqDrDRQtJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dryagrTxJevZw8MMDhQlNbTPOGJW34q1HEQH2EBYmGdCCkUYoRW8fEay0Kmn7JRU3MJNzhfDICM4LYdCC5TzPVB5URqm6F9YgZdO77wju4s1NuqVkvIah4LQjKl3Vy7MyrhxQ5nFBsak8IGXmKmZA26kWJR+p4wA8Bz/wGs6qgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiuOTSup; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-137dd497007so177154c88.1
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jun 2026 01:16:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780388168; cv=none;
        d=google.com; s=arc-20240605;
        b=LNxZKVuo8sWA62aWfxEWdcQYOrHlkC23OTEMRDHkZGUurR57HYX3TkW4n7kxZNrboy
         mdO/2NGQYpbOVt4G036qu0W6tN7OPuEOL81fkuTZTbOG78n2omu2E1VmM0yZD+7yVG0I
         E/GdcJxp98sEONq9Rev6sZppCztZXhNL5bJsTPaY/vfGPuEknqlyKhxcBIfeUnp0NEqq
         YwDd46eO8BqyBx7jaH6l1khZakFnXXHvlIYSeJidc/Z8t/vAN9x5qOhEZthPyxDKM61j
         AU+AGsaMYuwKKVW9/AODGlUMUmE8mAlTzKdjWSK1IgnVEr7DFtuaS0dW6FuaLrrGtp2h
         dulg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ch5pZyCWm4hnwRyszRObv2D+1iLVbXGqsVV4DrLX8U4=;
        fh=Rwq5WS29QFT2a3ZgU35Tq+9A4L80IbUx/FByFsr1UhM=;
        b=YimOOChwRaVT6zJRnwbJ5ntpdLEtpWsAUMOa00GgTVvEY3tYbWHrpRidAg4KCHlWaI
         xDrxKOLgE9bHgGX8xlv3iYN2ryrP7wyUS94fMZ4VoMCOwSu8JXLt87eAGMheFLewiTIM
         DmXo96Jjn2WXKLYOHaDRLV98y/OpS2Ib0GDGQk01WqCSrOuB7ffcrcJWv+0Sf7w+C4N/
         9BH+HntNeit0wDqY3PtAlHuvb/ne+AHkSZmaSZ6JWl+bXn4JNqwzBV0DOgkM6jpSu6rG
         Eh7nSo0VRYEJie5+PHEB7mUEJZ+qhGe9d2e0fmwquFZxbNL6gQzuJVa0tyrqLKExtVk3
         aGTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780388168; x=1780992968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ch5pZyCWm4hnwRyszRObv2D+1iLVbXGqsVV4DrLX8U4=;
        b=PiuOTSup2AeWIdIePo7noWcVlGZukB95pFHkXd41EgxH9ez/3MLFX8Q/Zn1KZ09/U3
         yOVQZJogfDTp+5Auk3gQt+Xi/FB6rT2iWU8/0jLohFIpXEW5U8uVjUSYgnwx10VZwaGl
         /lW8hG5HbJ21gEZ7UJqSQa9SrPT+hNY2Ly57e7lN6RBrQvS217BQA6rkipkLD5h9ehGg
         xTg7JrtEJN3YkViB1zYD1R9c1KqP7tTKcuG53dkou9WlMO5np7Hzn2f38UdLrWUehJUl
         wftmXdWDLbYWygQSsx+LDZtdtqQSbKQccMtXC8kcj/hR3EWC+w7k65f2cFDm9dYp/HMg
         fCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780388168; x=1780992968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ch5pZyCWm4hnwRyszRObv2D+1iLVbXGqsVV4DrLX8U4=;
        b=nIRLpnLKxeX99q/XxjiO3Tr/7Cpd7fdSO1vq3dmcoEvezu+2LjWOzaCx3MXRa99fiU
         YcT6kue2UGUBjFUnCMMNsP6SOWs641BXESF2E9nxNCVuSh7Xj72T0/SHy94NWHLM2s6B
         +7sq8lNmjj8/nnv9Ao5n+b/veQCqZ4TW59fc2Xmhv+y1g8Q/qCU2ANHw83igy9iUVzmp
         CYcbZWTpS1n4HIwOZl7GcA89qpMOnBTLA0Hvvp08RNZzvj3CTPiuXAQc/xYRvgRjxxex
         9bOByqRWg/z1oWmQEOC4MRgo5r98jUHGrwcZxERlzPBMSrE7YZMo0kd0CS1XgY1z+Gpk
         9WOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+E0OEghPeVG9bYJjPHZyBwNA2QASAP3Mp1bxuvwD+4yaIWElKso1OFGXW7twCNmLu5PhsyUg6bSF+ZJUY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm4i5z6lobeDaN/wcXxSvMTQPctiJf7jQgdkolkEtRVwwdvfKH
	Gh4NcaO2DA86xT6hzEhQaYjpYctr+RFsK18Ym8smKPCPmp1U5jo0OwrB+HT4I2I4AWXQnR944+R
	daiV8Nv65ahSYtJkyIblpvL9lDcq589o=
X-Gm-Gg: Acq92OHsIFodwV+clLqmR3GF6dSNZSxHUkODlEngIvgic0PRmfHFhTWfUAgmgM3dVou
	s+HrQO0qS/knJ3GKrolXudS3+9cItguUWJzSxftxxZISmZC/yl8lyxWjaCp9/LpfhCMbuUHzVMy
	+8sG6nsw78vTOkHNIPzBDPve/Z8dnuYMN/2sazpS7wQsQWQL2LP3jt50Ocot2i4O4Yew0yt5aG7
	jzFOMsnb09vOSEtugrS2Lr0HuEknNzmRd8nXjG0grNo/v7VUKhxaeZcs/XOJPNksJDD10Fr87ic
	rYRcuzbMDrdXFIXs1GsmYqJ8JPXa/qUJ2vxZGsGZ6zWBh1V6G217itQAMFBo+48Hn36OsrYyZg7
	UI5t2nCtY11T4ECI6ZA+J6Ncr7oAUx4KhBQ==
X-Received: by 2002:a05:7301:688a:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-304fa6a2df3mr3064799eec.5.1780388168347; Tue, 02 Jun 2026
 01:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530184944.10459-1-contact@jkam.dev>
In-Reply-To: <20260530184944.10459-1-contact@jkam.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Jun 2026 10:15:55 +0200
X-Gm-Features: AVHnY4Kr2rO_WdzWReX31YPA6BhQ7X-dBlpTnNN1R-LvP3fsnSXU7SQN06u2DVg
Message-ID: <CANiq72kUgSZ_xD4iFqUftY+r3Q1oL-z2qHdZJDSSK+J2opxWTw@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: make `*.long-type-*.txt` a target for cleanup
To: Joel Kamminga <contact@jkam.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13469-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,jkam.dev:email]
X-Rspamd-Queue-Id: 5DBFB62A5E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 8:51=E2=80=AFPM Joel Kamminga <contact@jkam.dev> wr=
ote:
>
> This cleans up files generated by rustc compiler in the case of an
> error containing an excessively long type name that doesn't fit in
> a single line. Such types appear relatively frequently so the risk
> of generating these files certainly exists. These files are purely
> compiler artifacts and are not created intentionally by the build
> system. They should be added to the `clean` target to stop from
> cluttering up the source tree.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1236
> Signed-off-by: Joel Kamminga <contact@jkam.dev>

Applied to `rust-next` -- thanks everyone!

    [ Reworded and linked to the previous related commit. - Miguel ]

Joel: please check the rewording.

Cheers,
Miguel

