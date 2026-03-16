Return-Path: <linux-kbuild+bounces-11949-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAXjCemrt2nkUAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11949-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 08:06:17 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 204422955FE
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 08:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3061D3004D11
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 07:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C25269B1C;
	Mon, 16 Mar 2026 07:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rrvNm/sp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554F434A3DC
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 07:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773644769; cv=pass; b=YJ5Uy79wXEh5Ahz8gzeXBaRL3eSZS8t+fMbhJBgItc9hdDygMpknp1X/qYGLLhskQ2ME9rbHoJ/PSQ0LIFpN0yafbcb9NXGdgBY0Drh2a0z1qnYdrNeF28VrINNjOrjtpT+TrmaAYnqsLTzlfVDsY2fGGTPGP7q1zHEeNTY11Rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773644769; c=relaxed/simple;
	bh=DWa/MwbMbU4Cgy8HcLpzA6KnltFCFdwdVTLoxcjvQIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MGxDwCfQnDggsFARzItD5A7X6ZUezKxEf/JE38rINShInrXpI/Y5Nz8AnbVmereSE4iofY94MmZGt1O6ooEFre3mG/NPiqNrrnhDDM7oCq5uGKLfBaY7Uw4HvUyJ3UjyNS7t2t92gZBhPxqt97YuIE3iUYYyjZhr3b1st5KvYqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rrvNm/sp; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a3fd333eeso33992081fa.1
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 00:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773644766; cv=none;
        d=google.com; s=arc-20240605;
        b=I8CJ+F/NLZZgw+APjmqOy3zoOrXxorrjL14l3w2vHG4WZxK+wXAMZ8pE8lJW36T/N+
         5ZfkZDY2C7CkNArOhR76KPKlGvWTeRtzCTg2lajOcdCSxklLCTLxt0D7jCljlQjYHLFv
         xiBQBEWHqE48+EXuCGY9xZdaCqdOTYC0kVceMq5Mj9c7t1uEh+Yn/LhqR1CJD8xvk1rG
         60fHMC8bPvUXgMD8JQbqBGadCWR1xKFHOhpo0gr+6OF0bhWmzbcYO9lTWKpfd+AkBqJX
         bjWJauOR5+yWzP3McqUkiBKhbmISzCIZCLKT06Hi+HWaUWPGX6oTDPLrEWhfVeCDYfNm
         PXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DWa/MwbMbU4Cgy8HcLpzA6KnltFCFdwdVTLoxcjvQIo=;
        fh=ilEwYtsiJxfiz8Ulo6DSplBqVOPOHPoLSoM6gOnjuOM=;
        b=BX55EPcYFqHEZ3vx4gsox7YzfL1rTVNz789d5p+8ta0OlN+ZVmQidvnAxWif2S8w0Z
         XTyxsWZdC5+38htTKJIOoVj++Zh1XrvZi1Wsor7Wo8N9KzHYWilJLZ84//beAWZccCu3
         Rmfap19WWI7jj7mQ8S663PEvjcffgGZUDi7SsnzPd+SaH+ZIus5EyOT+JpZ/XmAa0bOz
         bRBNHvKvJrULONsfazn7uCd7JeqtNp4EnRSbUoCSMXsiMukSvVBlpLIuU5f9Yq4Px4Cf
         j/GykjnPfjhYIpuALUi3bQzmMxv52GjVVN02AJ9/s5AWk5IlGeUrHoFKjBYFtTEWaAp6
         lCOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773644766; x=1774249566; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DWa/MwbMbU4Cgy8HcLpzA6KnltFCFdwdVTLoxcjvQIo=;
        b=rrvNm/sp0ejqtQpts4YJvKIZJai0U7h6SimZ1+626FCi7l4L6Dzs/D5AfC15pRBoWr
         kv/dIm7CfHnm9HMv/wH+hAenKg7VAAA/E7tVULHXPbxFq6YGS4qlbY3FPnHscS4jfzMo
         D3dH3ecOve/eQGzSnAb4Ojy44wq5Nw/0FFYtscPxcItm710bCdD1kjJ/hOB3448XZy8f
         K4xi4VdbUD1F+Vo4MhfBcbKbgnUdds5xx8LCHziC6xxbqHA6MvyjhOKbbiisyPVocwZ3
         KxoLuACxgOlrc3AY0BNPbelvSOBLVO9w1iQzbOC3uVjI5svhEljwS33qC/sFSOyzUjaG
         pJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773644766; x=1774249566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWa/MwbMbU4Cgy8HcLpzA6KnltFCFdwdVTLoxcjvQIo=;
        b=rmRVxZpU0KqszBX0I0lbpHeVL5zV3Xk44iU8Oqhfve3ZB04yqkCuaG84sxW46FEixE
         +QsEDPtzJ8b3sK3lIcwitmY+q5p3y9D/uRQRTPuBrIY2nd5b/KHLt4vWiq3uKWtWDOxt
         6Ek37AkG2qsCDs53zfG/mc+JAjVSzji4wYokjeFMnAjx72Py8+AVEoQ3ZB+Odl2g7mQU
         ez/9ijdu513AmV01abPWbWTQITja7nV4SvYCyHdfBDMPEgYS2+atv3PlguhS2q5nCyEv
         k+7d7I7OatBDvXB0O7yrhQwmp64ivDJROP39Vtlm3CJg3zVifAm7PpAgH9jinBhKuZY/
         sWnw==
X-Forwarded-Encrypted: i=1; AJvYcCXaon7p7WlrWwsKghBahr9iZDGp8q5/nAjzsUlJCkRsAmKOAZVh2rvao8SeQS/9TxnnkNs+7yjiSa1OLJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Slx1weh6HIjGjDELiOrknaNV2MkGs1tvVJAEHNv/yeReXlbC
	hI6rDRDu7wWm1gfM/iGTxtwtg2WKmeeSw2eM9WzFRG8gsohicmHPYCzMeEdYw2weakpWe0C2chV
	8Yp7tsIT7ihHREM6DUlhRB15lA2KwJ6aMki/pyQ/M
X-Gm-Gg: ATEYQzxh1JMI3VcucGtqtWdRLQQ7qsLfbrPkrz9evbciZOi7TAd9qmdLCzuOawmpCcs
	WkM4Adp8zcu19IpJ0yzKDS8JlAOiLJK55qG76/a+d0j/mfX1QN8cEu4ACAwPOJNPt1zG/TUpjIZ
	V0d0jpUoAXNU10/bH6lF3K9jgGMG9wATxTs+I88RPuE2mY8G48W8cb69eAh4tBZQn45tAZnBYB5
	/D95sQ0ZeZ1+/speegFayfSsdiM26IFU+2LuZKiyWy3etSgIGCftIh273gWkPka6tuQqZRksmcs
	RvDRg5P1iICuK5h0vl2CykpcsI87Va6ThWhLBArKkMRTUCD+gF8YFsznXGxyULPtZDdpyg==
X-Received: by 2002:a05:651c:4356:10b0:38a:2db9:eb72 with SMTP id
 38308e7fff4ca-38a8864c94amr30667511fa.16.1773644766146; Mon, 16 Mar 2026
 00:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313150928.2637368-1-sashal@kernel.org> <20260314111822.63a2ba4a@kernel.org>
In-Reply-To: <20260314111822.63a2ba4a@kernel.org>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 16 Mar 2026 08:05:53 +0100
X-Gm-Features: AaiRm53tuutFjpddzDm8MgJQk_X6I9zzb6Uz-8-_BFX3BICSXZm9HxgKcE0xoPQ
Message-ID: <CACT4Y+arWePyxnV3hWk5RanWZpoc7=ALQ6DV_2MCuQkNoTtJUw@mail.gmail.com>
Subject: Re: [PATCH 0/9] Kernel API Specification Framework
To: Jakub Kicinski <kuba@kernel.org>, syzkaller <syzkaller@googlegroups.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, tools@kernel.org, 
	x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Cyril Hrubis <chrubis@suse.cz>, Kees Cook <kees@kernel.org>, 
	Jake Edge <jake@lwn.net>, David Laight <david.laight.linux@gmail.com>, 
	Askar Safin <safinaskar@zohomail.com>, Gabriele Paoloni <gpaoloni@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11949-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linuxfoundation.org,lwn.net,infradead.org,suse.cz,gmail.com,zohomail.com,redhat.com,zeniv.linux.org.uk,linux-foundation.org,arndb.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dvyukov@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,raw.githubusercontent.com:url]
X-Rspamd-Queue-Id: 204422955FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 14 Mar 2026 at 19:18, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Fri, 13 Mar 2026 11:09:10 -0400 Sasha Levin wrote:
> > This enables static analysis tools to verify userspace API usage at compile
> > time, test generation based on formal specifications, consistent error handling
> > validation, automated documentation generation, and formal verification of
> > kernel interfaces.
>
> Could you give some examples? We have machine readable descriptions for
> Netlink interfaces, we approached syzbot folks and they did not really
> seem to care for those.

I think our reasoning wrt syzkaller was that not all interfaces in all
relevant kernels are described with netlink yml descriptions, so we
need to continue using the extraction of interfaces from the source
code. And if we have that code, then using yml as an additional data
source only adds code/complexity. Additionally, we may extract some
extra constraints/info from code that are not present in yml.

Realistically system call descriptions may have the same problem for
us at this point, since we extract lots of info from the source code
already:
https://raw.githubusercontent.com/google/syzkaller/refs/heads/master/sys/linux/auto.txt
(and LLMs obviously can allow us to extract more)

