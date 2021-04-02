Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4191A352B5C
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Apr 2021 16:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235601AbhDBOUL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 2 Apr 2021 10:20:11 -0400
Received: from mga06.intel.com ([134.134.136.31]:45814 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235522AbhDBOUK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Apr 2021 10:20:10 -0400
IronPort-SDR: Sdpq9vIDpjz2fN/sYwaFM+ouRIcantrMTnF7dZIA6NT20zaloeKOjNEn+gn+/Uf6TG6oWgdSfm
 X6WLXitjY29A==
X-IronPort-AV: E=McAfee;i="6000,8403,9942"; a="253808781"
X-IronPort-AV: E=Sophos;i="5.81,300,1610438400"; 
   d="scan'208";a="253808781"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2021 07:20:08 -0700
IronPort-SDR: 1KuUsnhfx+cJ29KdpMhs9HTMt6WKL6s17ZF45xg3zqUmmnj2JB70iO3vghDZsx9tK4kKPmPYDL
 uNMJJPwiuNwg==
X-IronPort-AV: E=Sophos;i="5.81,300,1610438400"; 
   d="scan'208";a="379707853"
Received: from tassilo.jf.intel.com ([10.54.74.11])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2021 07:20:08 -0700
Date:   Fri, 2 Apr 2021 07:20:07 -0700
From:   Andi Kleen <ak@linux.intel.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2] kconfig: config script: add a little user help
Message-ID: <20210402142007.GL1285835@tassilo.jf.intel.com>
References: <20201219170805.7151-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201219170805.7151-1-rdunlap@infradead.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Dec 19, 2020 at 09:08:05AM -0800, Randy Dunlap wrote:
> Give the user a clue about the problem along with the 35 lines of
> usage/help text.

Reviewed-by: Andi Kleen <ak@linux.intel.com>

-Andi
