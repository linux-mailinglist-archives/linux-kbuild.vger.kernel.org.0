Return-Path: <linux-kbuild+bounces-12721-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKSJHu9E1mkFCwgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12721-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Apr 2026 14:07:11 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A8E3BBBFC
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Apr 2026 14:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2ACEA301939C
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Apr 2026 12:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45B23BE14A;
	Wed,  8 Apr 2026 12:05:57 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374193BD64B
	for <linux-kbuild@vger.kernel.org>; Wed,  8 Apr 2026 12:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775649957; cv=none; b=lytl2Ee7V+NbDUv0E4BAX5YuNddrMruf5qAlR9ayUOTF5ryPD6RIVaHC5yuyeXkVl4+DxKK+RZNWhRs2e3xIV+XcjmmTBNrqPztF89fo4jYh0PHcZc7PpJ/HxNnFAw8CuYBHgXLPHqO8MR2wYkCR5izIOqO06iz/XjR0zCshNWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775649957; c=relaxed/simple;
	bh=8scfsOfxjJCA7PsheVSzcMVVAN4HZJ5wygd7fo905BM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vy6eYkElWwiI1XprWr868PMy9NhkOus+uivmRgsO+0KeyaXM9jz7yjZNmoNK4zvsarnSrXm6RD2GkBZlWzVb41swx/fS4XWL9+CEU4Bt1H8tKR6/eHm9USm3ccC46H8iQslHq9YAm7qzYXUweoQVl2+V6h7mOmsvf4xifLp9V4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56d9ed609d2so1843904e0c.1
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Apr 2026 05:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775649955; x=1776254755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGRbYznGbDw7bAVfW0akDmACi6u2DoC61pG2AP+p98k=;
        b=q3A118EMd3vRRqVL/lUu/ERJbfvbli0M+MDjFzktuLMkp//atiy0XfQd/MdsBmaBJX
         FjuRQzJNM7p7AFHizmQZFF29VlRXFIg9HD8S9BaQc3hZuoQtPSxjt3eYQIMO92cAzd7a
         DRfbXrSg0LcaLv+dH+QgIb/GsSPu84Rl//Ecmv4GRb/LcQFovNTt6dIuuJAe2M5En1Th
         MWJwhwx22Y0e1ZfWNn9sRnXa5rEPk5U/hPZJ9POgJhTHS75h1fg0hv4zvhKvMIv9wmsY
         pjKnyQ3qrhixmMIndkYqAgKzXR6D5BNVV5BNjaZQ4BC24EQHtwmwFuATtgNbX8zFKpH7
         C6QA==
X-Forwarded-Encrypted: i=1; AJvYcCX/L6YMM+VpHJSWcgQM7Jc+ZvvntGvxfvt2d1Ypt2+mJpykU47RYlVmLzaRvVZklowgF54QAH1MhP10izI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIKntwyDeF93q8sZdQhxyk3SvMyaV5HECGpAqOkpDvamHhs6OS
	BrEfjdqKluc2PEbGA5i3VlfvBlP+sdlCeFadC4mhc1SYJMnjMGffSDRSuzC04yU1
X-Gm-Gg: AeBDievQnATL+WrvrIDI356o/Kdd8WEouiD+CPvv+hLaByQrLL0ag4rT4EjHJYZ7Zo4
	RVnxG30sMX+NVNBIkyzxMIsgVi9g3LhMgfnK8OZwoULHG9hCVsDpRuzgCohmSkA72ENJL79Aw2G
	3rMBs26kVnE5/Y3F+s0eIqypDqHR7jZ7d6IDZCIOpPUJYv14poBw8AwGBt2ZBDN7RhRPVEYcEDt
	QMiifONagkJGlYaTSDQzy5uNdpZ5sPaR79YcybZhI1OLMKl6wyAUZT4hJ5IszoAtPB5dYVl0h8t
	kKgHe7mVWlxFN0RXNLFbeYLVaTCFP7XcZNC30fcwdlmZUJ9RG8/rLweAMt4mGUJ5wV/SAwXZzQB
	fuXWwXh91PG1mqnKdP4CH8HDX80Cu3jRuZrGNih5mL/XUXjd/CaPSGv8J8eWYix4FRjf1OBV4ys
	7QBLXJQbD2bdLHbs8B9LKXbWGQjRuRN3cvpO00GgdrVKVpqkQvrC3FimVbLAk3gdNq
X-Received: by 2002:a05:6122:20ac:b0:56b:9ba4:1372 with SMTP id 71dfb90a1353d-56dab9dfa4cmr7334594e0c.9.1775649955070;
        Wed, 08 Apr 2026 05:05:55 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9ba826f6sm19859685e0c.2.2026.04.08.05.05.53
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 05:05:53 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56eec951db1so1033350e0c.3
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Apr 2026 05:05:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqztNQGSVWvQbMEMPNSH4HHr+Ozo87t82wEratsoDvrzRFdApsVNFPKdfkbex+udFz76bGVwAt2/a1pFc=@vger.kernel.org
X-Received: by 2002:a05:6122:3784:b0:56d:92dd:a0ad with SMTP id
 71dfb90a1353d-56daba970e8mr8020585e0c.15.1775649953503; Wed, 08 Apr 2026
 05:05:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313150928.2637368-1-sashal@kernel.org> <20260314111822.63a2ba4a@kernel.org>
 <abZTg9ZwnE5J4qXa@laps>
In-Reply-To: <abZTg9ZwnE5J4qXa@laps>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 14:05:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU5Ga9WCzD8ji8kgOMmosS+uzf_8mp_OkhFdcAg2=3KAg@mail.gmail.com>
X-Gm-Features: AQROBzA3VNDAkN7JQ2RBFKXcNeNTnnQqU_cNeGRDhYiY7nC0FR4lVKTSqS90qsM
Message-ID: <CAMuHMdU5Ga9WCzD8ji8kgOMmosS+uzf_8mp_OkhFdcAg2=3KAg@mail.gmail.com>
Subject: Re: [PATCH 0/9] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, tools@kernel.org, 
	x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Dmitry Vyukov <dvyukov@google.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Cyril Hrubis <chrubis@suse.cz>, Kees Cook <kees@kernel.org>, Jake Edge <jake@lwn.net>, 
	David Laight <david.laight.linux@gmail.com>, Askar Safin <safinaskar@zohomail.com>, 
	Gabriele Paoloni <gpaoloni@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-12721-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linuxfoundation.org,lwn.net,google.com,infradead.org,suse.cz,gmail.com,zohomail.com,redhat.com,zeniv.linux.org.uk,linux-foundation.org,arndb.de];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-kbuild@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.065];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 82A8E3BBBFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sasha,

On Sun, 15 Mar 2026 at 07:36, Sasha Levin <sashal@kernel.org> wrote:
> On Sat, Mar 14, 2026 at 11:18:22AM -0700, Jakub Kicinski wrote:
> >On Fri, 13 Mar 2026 11:09:10 -0400 Sasha Levin wrote:
> >> This enables static analysis tools to verify userspace API usage at compile
> >> time, test generation based on formal specifications, consistent error handling
> >> validation, automated documentation generation, and formal verification of
> >> kernel interfaces.
> >
> >Could you give some examples? We have machine readable descriptions for
> >Netlink interfaces, we approached syzbot folks and they did not really
> >seem to care for those.
>
> Once the API is in a machine-readable format, we can write formatters to
> output whatever downstream tools need. The kapi tool in the series
> already ships with plain text, JSON, and RST formatters, and adding new
> output formats is straightforward. We don't need to convince the
> syzkaller folks to consume our specs, we can just output them in a
> format that syzkaller already understands.
>
> For example, I have a syzlang formatter that produces the following
> from the sys_read spec in this series:
>
>    # --- read ---
>    # Read data from a file descriptor
>    #
>    # @context process, sleepable
>    #
>    # @capability CAP_DAC_OVERRIDE: Bypass discretionary access control on read permission
>    # @capability CAP_DAC_READ_SEARCH: Bypass read permission checks on regular files
>    #
>    # @error EPERM (-1): Returned by fanotify permission events...
>    # @error EINTR (-4): The call was interrupted by a signal before any data was read.
>    # @error EIO (-5): A low-level I/O error occurred.
>    # @error EBADF (-9): fd is not a valid file descriptor, or fd was not opened for reading.
>    # @error EAGAIN (-11): O_NONBLOCK set and read would block.
>    # @error EACCES (-13): LSM denied the read operation via security_file_permission().
>    # @error EFAULT (-14): buf points outside the accessible address space.
>    # @error EISDIR (-21): fd refers to a directory.
>    # @error EINVAL (-22): fd not suitable for reading, O_DIRECT misaligned, count negative...
>    # @error ENODATA (-61): Data not available in cache...
>    # @error EOVERFLOW (-75): File position plus count would exceed LLONG_MAX.
>    # @error EOPNOTSUPP (-95): Read not supported for this file type...
>    # @error ENOBUFS (-105): Buffer too small for complete notification...

The actual E-values are positive, so I guess you want e.g. -EPERM?

Note that the actual errno values are architecture-specific.
E.g. EOPNOTSUPP can be 45, 95, 122, or 223.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

