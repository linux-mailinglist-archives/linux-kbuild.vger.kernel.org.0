Return-Path: <linux-kbuild+bounces-11936-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3/fAJd/ktWla6gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11936-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 23:44:47 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2BB28F5DE
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 23:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8621730214D2
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 22:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F1F37F8C9;
	Sat, 14 Mar 2026 22:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUHvKzBF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E173358BF
	for <linux-kbuild@vger.kernel.org>; Sat, 14 Mar 2026 22:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773528284; cv=none; b=Qa/VCeC3LdRLkQRgPfXPXIdCjHdqpPiJaehHDVC5qajkimqxer29L4vnmVc+QgZsZVHC7hUpZUZZdJ1QFCTqfaBdddrJLhtrP2UZ8zF34WHai4iq6IJYHLSTnwdNsPBnmLWRCvUMQH80qfjo19YyvfI988G6yYdwYH579zPCD3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773528284; c=relaxed/simple;
	bh=+BzfWIbWutBn9FVLenIu2cDO6fBukYew6iGg+YJ9bLU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b0Se4qNJsku1BqBzC7omxBxo09Hnw0pA2qj/RoVIQmzV7nqQ+bo/tjVmJEyyhmmrhy6IXBpcLMsbUd2/y1aCVHjSLRx5FpKkfkwNXi6n7NbvoQV63TYp1a5KEFg92nZhwS7kAnhAN1rBUXr4xpAXzJW6PBN/MJB65bxsZHODdHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUHvKzBF; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-89a09ef1e3aso44892506d6.0
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Mar 2026 15:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773528282; x=1774133082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuJUhym4M/ZFIJ+HRVLrIiZVMxaVq6Aogwi4UFclA/I=;
        b=HUHvKzBF5hhX4JfsIma2dg7iVHahQVXvhnXj8AsIHtXNbMgTUuSYsPwy8VLT9xnEzF
         EeX7jt9RC7YfoK+BU25zJMWlMfztSjsh3LnnNpj0z0DyMWJqPXNAXYzgXzCr8TyUV0E8
         QwN8SbxvwIoa1lZiVk+/ugNlZzDW5T1SeilDNtenbONU4IVtyDb5jrAkYPnnyjoXawjR
         Eox8mi29T0lZpOE9gmj0Fedk5acbLbj8L20uDD9X1MIqxRUUFgjHdJj4pPZRH+cX/WKG
         FVAixQnIPaGULYn/1rQ5NgpgG4pP3cblsCvSepBTlhftfQ/CD85LZ15xbYP44UzQuVmT
         HPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773528282; x=1774133082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nuJUhym4M/ZFIJ+HRVLrIiZVMxaVq6Aogwi4UFclA/I=;
        b=j2wHEQEaDyjn1P0lW2aFKiQdlr6x59lG1D4xOteqyCeYyPo0TVh86OWHxSJfBo9S1I
         tWIa+CWy4YJGiOF8i/V8xQMJtq6/duU9kKPE9gPhF+pOBb1TTZaW9ufbIy1lkEm17bzg
         7kbq0DWCzZhCXDNRe2RZC9SwW1Y5N+gaOsbrhsD6Kqwl86Wi0ww8OhCej+h/9yJKtVei
         JGmgd2dmUDk2I2N7u15ryC6cYfZzO/zrbdk0vWQ5QRU66JPc9pXcwmZggMFk8pBYoh7d
         QqSxzoMcB4kuaQjhMOi4709CHl9+IvzdDho1DLAhnT+KUe3xRe8+EzUpQDn8xUBHB9fG
         aT1A==
X-Forwarded-Encrypted: i=1; AJvYcCXytat8uNMIhbYrgiTZsiqP9g4M0rVlcBtbaads9sUElzvsZmsB5SEZMXftul+VMsFOGnkstq11ArwIOxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfgWJ3tA6FF9NvNgaxBDOQNdIsmxWQbPofZtoF27Pr1ycEtvOl
	YBl9beGwjQE7A75heasakoPVY4r+g/rptcFwugCnCjUYz/E1rgzLIxdO
X-Gm-Gg: ATEYQzyrNIHx6sTYZeimYdMpqcgqfZMhWtAtS2oLcZY/cS6uDkMzBDfotQ0yXS3PdhS
	z8FBxuR3OiwIl0F6wZ3MGTZAjvUaGwk5lLtmhrjwVIJahNHHenBLUOqXRsjKTH/UWJxeGZtTL8S
	TezYM05lWPRInQbuxmTUm5SMql/GjGLdB6REPbnaTuFzPKdvniI7cex4pZVCqEElWmeJKrHe2S8
	T3AAX6RAN7y/Lyngn5/GWk0toNqbUtLjodKLpRBBboKKc+cXkL1rrf7T3BoSGFgG9TNh2bRbJo3
	UC8n6e//9HFxt8LijEa+cCXxcMnXCRHvL95kigSUj1TCDVZx/mANW5nP8zGYOzhGX761vOVsI1K
	vTHK2G2QlFDYAkCYzm/Z1TI1i+n5540H7Nei7FL7YiGaZwFzqMDbOmbExf+zU7hFbY3/pSk0Pk4
	0lLX2PAXXoG/lP/JUEg6MHVxj9EoE21Jg4uzHVVOwRyEp1sK55PsYlvwh5Ec9hZwZH
X-Received: by 2002:a05:6214:529d:b0:89a:173d:9c54 with SMTP id 6a1803df08f44-89a81cb9be9mr117730886d6.8.1773528282565;
        Sat, 14 Mar 2026 15:44:42 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c43bb47c3sm11296526d6.14.2026.03.14.15.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 15:44:41 -0700 (PDT)
Date: Sat, 14 Mar 2026 22:44:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kselftest@vger.kernel.org, workflows@vger.kernel.org,
 tools@kernel.org, x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, "Paul
 E. McKenney" <paulmck@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Dmitry
 Vyukov <dvyukov@google.com>, Randy Dunlap <rdunlap@infradead.org>, Cyril
 Hrubis <chrubis@suse.cz>, Kees Cook <kees@kernel.org>, Jake Edge
 <jake@lwn.net>, Askar Safin <safinaskar@zohomail.com>, Gabriele Paoloni
 <gpaoloni@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>, Arnd Bergmann
 <arnd@arndb.de>
Subject: Re: [PATCH 0/9] Kernel API Specification Framework
Message-ID: <20260314224435.35465615@pumpkin>
In-Reply-To: <20260314111822.63a2ba4a@kernel.org>
References: <20260313150928.2637368-1-sashal@kernel.org>
	<20260314111822.63a2ba4a@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11936-lists,linux-kbuild=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DE2BB28F5DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 14 Mar 2026 11:18:22 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Fri, 13 Mar 2026 11:09:10 -0400 Sasha Levin wrote:
> > This enables static analysis tools to verify userspace API usage at compile
> > time, test generation based on formal specifications, consistent error handling
> > validation, automated documentation generation, and formal verification of
> > kernel interfaces.  
> 
> Could you give some examples? We have machine readable descriptions for
> Netlink interfaces, we approached syzbot folks and they did not really
> seem to care for those.

The whole thing reminds me of doxygen comment blocks.
They tend to make it hard to read the source files, hard to search
the source files (due to all the extra matches) and are pretty much
always out of date.

The kerndoc comment blocks for trivial helper functions are hard enough
to keep up to date.

The only way even parameter descriptions are going to stay correct is if the
compiler is using the definition and only the comment part is extra.
For error returns you'll need the documentation to be at the return site.

	David

