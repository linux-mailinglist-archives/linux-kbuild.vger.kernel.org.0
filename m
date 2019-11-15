Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12567FE45F
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2019 18:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfKORwe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Nov 2019 12:52:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30912 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726365AbfKORwe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 12:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573840353;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dGqn2wXaDwx9A6TmaPBjbD4iV16jXQiloPf6sWcs7RQ=;
        b=cMX8at+7lw88n56wv6sKfdo2cvRWF1zSRrq+B3hj4nPzYOXg3pwOI+kNu+YH9olxkdYzq4
        623++W4JZlw5WomSiFmlKcByiuY6hZiaLRKtryA7whlHsWyMMxrq8lPRhIpxs20a7UVu2z
        bO3mJF3IA2DMQki01TDK5RfV8S2MYnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-4q1upNmyPdygPntzOWZ9Hg-1; Fri, 15 Nov 2019 12:52:29 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D049A801E7E;
        Fri, 15 Nov 2019 17:52:27 +0000 (UTC)
Received: from treble (ovpn-120-26.rdu2.redhat.com [10.10.120.26])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EF2360BE1;
        Fri, 15 Nov 2019 17:52:26 +0000 (UTC)
Date:   Fri, 15 Nov 2019 11:52:24 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Shile Zhang <shile.zhang@linux.alibaba.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH v4 0/7] Speed booting by sorting ORC unwind tables at
 build time
Message-ID: <20191115175224.ozuiei2vlfvynok5@treble>
References: <20191115164539.57930-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20191115164539.57930-1-shile.zhang@linux.alibaba.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 4q1upNmyPdygPntzOWZ9Hg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Nov 16, 2019 at 12:45:32AM +0800, Shile Zhang wrote:
> Hi,
>=20
> I refactored the code, followed by Peter's suggestions in v3, thank you!
> Any suggestions and comments are welcome!
>=20
> Thanks!
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> v3->v4:
> - Code refactored for Peter's review findings and suggestions.

Hi Shile,

I haven't given it a proper review yet, but one minor suggestion.  In
general it's good practice to wait at least a few business days before
posting a new version of a patch set.  That way it gives people time to
review, and it also helps to avoid flooding people's inboxes.

--=20
Josh

