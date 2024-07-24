Return-Path: <linux-kbuild+bounces-2637-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C89F793AE41
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 11:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22534B22C68
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 09:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E9E13AD33;
	Wed, 24 Jul 2024 09:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UMRHJkNx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E35F1C6B4;
	Wed, 24 Jul 2024 09:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721811823; cv=none; b=h3qQd9w08KuYuM6davhSyueBBD1xWtMnJ/K3iIaJbQD2zULBDq04lWn7e+WKXyPH5Fh4G84fxs5tcH8E3J8JZmCfWQCAKjjbf/7SZsYicUyb8uabAR0xvAyJ3LpRu43aQZHuSwE28Dhns0a3o1Vw7xh2fuJ9ZBIv8n6cVo32CQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721811823; c=relaxed/simple;
	bh=CXO/oCJPXkmg5ipVzpiYFapSfyktKmNvea8mWTccJpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XoUVqNQod4k2cANCgaoJzGyz8mlmpu17I/+1t23Mgk/0Z9xfTCyQVxS1BryFZA3uKtzcpqU/AOxo1LlCD18Rt1t/LnNV8l0jByq9uB7W8SuBA0kbsao3KrYDMC4KsaTj/7jC9obwfR0FlZLTXGSI6eifbgrC4eM4iRM95tTZMdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=fail (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMRHJkNx reason="signature verification failed"; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A9FD61F796;
	Wed, 24 Jul 2024 09:03:39 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7683D1324F;
	Wed, 24 Jul 2024 09:03:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 73DjG2vDoGZPUQAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Wed, 24 Jul 2024 09:03:39 +0000
From: Petr Vorel <pvorel@suse.cz>
To: pvorel@suse.cz,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: aquini@redhat.com,
	linux-kbuild@vger.kernel.org,
	masahiroy@kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] Kbuild updates for v6.11-rc1
Date: Wed, 24 Jul 2024 11:03:27 +0200
Message-ID: <CAK7LNATbZgv6JNzSXznOm47oNUXku430-taoK4iE1G0YcBy4Lw@mail.gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240724084655.930706-1-pvorel@suse.cz>
References: <20240724084655.930706-1-pvorel@suse.cz>
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201]) (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits)) (No client certificate requested) by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDD513D628; Tue, 23 Jul 2024 19:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18353C4AF0A; Tue, 23 Jul 2024 19:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org; s=k20201202; t=1721763884; bh=NZPmwx9zHNHao+9I+jeqDdDmRqjZJBybf9j7OA7CvSM=; h=From:Date:Subject:To:Cc:From; b=UMRHJkNxQBBFJiGxxNfWBDsa6DlLZqlRw4QOrIrX3Ddq+rlTJOXKPMU1C5tqC33fD 6ZGcwPWlhLVKxBtVBJslUJKaeF3kVh4Lw5Qqs4px+TsAvpJdITiO+HPwLmVFBX5Ne2 QFI1wgJ0sP4JtZbbsEMSOCzpS62ZdN+MMCretwNDUS5DeWw+ARGuFFWXvYHTcPrcxa +0n8+IHfv1bjpJlgkuLfa1tqWm5UA8TFL+5cEvPloxD81ZUdIwxuCuZEIf83rR/S9t N1cvyzGYHZW5xpXvIlLMh9ar7AJTVUx4EpJLLsxdvilw9ApALzmFLgIgEDJzDV1H9O RqgL5NRk6dqjQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ef2c56da6cso28379731fa.1; Tue, 23 Jul 2024 12:44:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0QkgwKRHktkVv9CLrYQ1EcbRxDtwBYqdFLr2GViWcS1jzOAiZddwRLwwuxCfEjojUxgOvVcGYDfDDrKySE6j3bfCoxk2XjPUSPRnl
X-Gm-Message-State: AOJu0YwCKhj+6QGjvELgD3J3OicPPeTJm9O4v1Pkb+V3kcuUSb5ShA0X 2Li2bUIPrQ/UV/tPE2ScL/HYPPdCUkMIBwq69l63OmdEswPHnriw5+Ydt8xS0YXFNH5mUxVCwMH 5ChiwQYo5CsDksJPDJl0jafHabms=
X-Google-Smtp-Source: AGHT+IHsx8NQ92WXFtFm/EntXaO6XfThBXsCF/ZIbdZLOIBhnlnnKPPU+cBZbfYo1vP//NaL5Xi3Yya0upg3yrpTd4c=
X-Received: by 2002:a2e:a41c:0:b0:2ee:494c:c3d3 with SMTP id 38308e7fff4ca-2ef16847a34mr81457881fa.43.1721763882725; Tue, 23 Jul 2024 12:44:42 -0700 (PDT)
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Gmail-Original-Message-ID: <CAK7LNATbZgv6JNzSXznOm47oNUXku430-taoK4iE1G0YcBy4Lw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: A9FD61F796
X-Spam-Level: 
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00

From: Masahiro Yamada <masahiroy@kernel.org>

Hi Masahiro, Linus,

> Hello Linus,

> Please pull Kbuild updates for v6.11-rc1




> You will get a merge conflict in scripts/Makefile.lib

> It is a conflict between the following two commits:
>  49636c5680b977d8a39263c6c8db6061c427346e
>  712aba5543b88996bc4682086471076fbf048927

> The resolution exists in linux-next.

It'd be nice to include also this tiny binrpm-pkg fix [1] for non-english
locales (introduced by 301c10908e42 already merged).

Kind regards,
Petr

[1] https://lore.kernel.org/linux-kbuild/20240724084655.930706-1-pvorel@suse.cz/

> Thank you.
...

