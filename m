Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12C46307963
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Jan 2021 16:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbhA1PSQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Jan 2021 10:18:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42185 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231174AbhA1PSN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Jan 2021 10:18:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611847007;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4Fg7udZXlvfLLHzwve4X1QMdCahnQwMs0ZSOV+O7j8M=;
        b=A6bLGC/Kl2KSrz0cf6dkLorRcyASqFiQf1FfdL6dacuW1EZT+IJaBmZF02IESe938aB3zT
        AyvIByOfFTeLsnBputCHWoE0T5+btPPaeq0792muWvOWb4zuegdAu3qM+VBXBwGjZ+eDnb
        dGV0L7EcyBPe/VVQ8CawUevT/5uh+BA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-5RdBc43ROIK6zvjrJxsEGw-1; Thu, 28 Jan 2021 10:16:46 -0500
X-MC-Unique: 5RdBc43ROIK6zvjrJxsEGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6D4B80A5C6;
        Thu, 28 Jan 2021 15:16:43 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com [10.10.115.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 038FD1DB;
        Thu, 28 Jan 2021 15:16:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20210122181054.32635-1-eric.snowberg@oracle.com>
References: <20210122181054.32635-1-eric.snowberg@oracle.com>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dhowells@redhat.com, dwmw2@infradead.org, jarkko@kernel.org,
        James.Bottomley@HansenPartnership.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, jmorris@namei.org, serge@hallyn.com,
        ardb@kernel.org, zohar@linux.ibm.com, lszubowi@redhat.com,
        javierm@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: Re: [PATCH v5 0/4] Add EFI_CERT_X509_GUID support for dbx/mokx entries
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3568164.1611846997.1@warthog.procyon.org.uk>
Date:   Thu, 28 Jan 2021 15:16:37 +0000
Message-ID: <3568165.1611846997@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Which tree do you envision this going through?  EFI or keyrings - or are you
going to ask Linus to pull it directly?  I can pull it if it should go through
the keyrings tree.

David

