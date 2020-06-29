Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42F5920D6EA
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jun 2020 22:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732314AbgF2TZQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jun 2020 15:25:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48236 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730698AbgF2TZO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 15:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593458713;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lZIwwdY+4quyzpnR8PUmWqC5xEd+/+UfLosIlVye92g=;
        b=XfTI9qoX+sXb18yxRHATyx9lYlpAmQxaBGhH+Q59uMKyWWHF3IJC3OAk7st/0l13bAUF/H
        ASig2sVX3qHT0YY+4EvsIwvi/f1nTu7MtvnnBv6BQyBKSfqSCdqiNTi71HuD46AXwFp797
        zjzvXOB58eyS8FWNTE9M+s3DZnLNFQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-I02TrkkrNZaFJyo8zF93YA-1; Mon, 29 Jun 2020 08:23:52 -0400
X-MC-Unique: I02TrkkrNZaFJyo8zF93YA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D5D2464;
        Mon, 29 Jun 2020 12:23:51 +0000 (UTC)
Received: from starship (unknown [10.35.206.100])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 46A7D5D9DA;
        Mon, 29 Jun 2020 12:23:50 +0000 (UTC)
Message-ID: <649f4c040c2f6dd2d83e984a88343917d498b4ad.camel@redhat.com>
Subject: Re: [PATCH v2 0/5] Fix split view search and debug info navigation
From:   Maxim Levitsky <mlevitsk@redhat.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 29 Jun 2020 15:23:49 +0300
In-Reply-To: <cover.1593423060.git.mchehab+huawei@kernel.org>
References: <cover.1593423060.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 2020-06-29 at 11:35 +0200, Mauro Carvalho Chehab wrote:
> This series fixes some issues with search while on split view and fix the
> broken hyperlink navigation.
> 
> The first patches restore the pre-Qt5 conversion behavior. The last
> one implements navigation on a different way. I opted to keep this one
> in separate, as this one is a new feature.
> 
> Mauro Carvalho Chehab (5):
>   kconfig: qconf: cleanup includes
>   kconfig: qconf: ensure that only one item will be highlighted
>   kconfig: qconf: make search fully work again on split mode
>   kconfig: qconf: make debug links work again
>   kconfig: qconf: navigate menus on hyperlinks
> 
>  scripts/kconfig/qconf.cc | 120 +++++++++++++++++++++++++++++----------
>  scripts/kconfig/qconf.h  |  15 ++---
>  2 files changed, 98 insertions(+), 37 deletions(-)
> 
I tested the series, and it works really well here.
Thanks a lot for the patch 5, I indeed noted that 
I am not sure it ever worked like that but it does now, 
and it is a very good improvement in terms of usability.

There is still a tiny issue in patch 5 - sometimes already
selected items remain selected like it was in the search (now fixed).

Also I found another bug - clicking on '..' menu doesn't work:

For example select 'input device support', then 'keyboards' on the right,
then you can't get back. It also might be something that never worked,
and it doesn't bother me, I just note this for reference.

Thanks a lot for these fixes!
Best regards,
	Maxim Levitsky

