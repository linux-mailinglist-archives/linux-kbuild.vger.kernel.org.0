Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03433131A83
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jan 2020 22:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbgAFVdt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Jan 2020 16:33:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33091 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727139AbgAFVdq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jan 2020 16:33:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578346425;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8ZH2G/JTot6OPpDakMqvB1skfWHMhWrQnGwWc63arzk=;
        b=PlRqsZzezCQoQv5gWk7J95SVRqFtRN3yEXiDcU0HU8ZvdgAKbkHib15oXE1tV4tV+zYsIj
        RWzWE0DQhHjApwjB1N2gP4BCrL8p34dtTlvxOiPmPDgvk+noAnwThmPu9WlDwvnR6pnECJ
        8wiq6SfKUaxfvrJpM8z9j+pusuHPlSI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329--QWKhjTnNNinoRn0TlM2Zw-1; Mon, 06 Jan 2020 16:33:41 -0500
X-MC-Unique: -QWKhjTnNNinoRn0TlM2Zw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B66DE8045D2;
        Mon,  6 Jan 2020 21:33:39 +0000 (UTC)
Received: from localhost (ovpn-112-4.rdu2.redhat.com [10.10.112.4])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6B41C60CD1;
        Mon,  6 Jan 2020 21:33:37 +0000 (UTC)
Date:   Mon, 06 Jan 2020 13:33:36 -0800 (PST)
Message-Id: <20200106.133336.719905028750983361.davem@redhat.com>
To:     masahiroy@kernel.org
Cc:     linux-kbuild@vger.kernel.org, sparclinux@vger.kernel.org,
        arnd@arndb.de, bcollins@debian.org, michal.lkml@markovi.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] modpost: assume STT_SPARC_REGISTER is defined
From:   David Miller <davem@redhat.com>
In-Reply-To: <20200104153651.2258-1-masahiroy@kernel.org>
References: <20200104153651.2258-1-masahiroy@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun,  5 Jan 2020 00:36:51 +0900

> Commit 8d5290149ee1 ("[SPARC]: Deal with glibc changing macro names in
> modpost.c") was more than 14 years ago. STT_SPARC_REGISTER is hopefully
> defined in elf.h of recent C libraries.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: David S. Miller <davem@davemloft.net>

