Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D11D130DB2
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jan 2020 07:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgAFGsC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Jan 2020 01:48:02 -0500
Received: from mga05.intel.com ([192.55.52.43]:22343 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726641AbgAFGsC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jan 2020 01:48:02 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Jan 2020 22:48:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,401,1571727600"; 
   d="gz'50?scan'50,208,50";a="222171775"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Jan 2020 22:47:58 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1ioMBB-0003Q5-HB; Mon, 06 Jan 2020 14:47:57 +0800
Date:   Mon, 6 Jan 2020 14:47:19 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-kbuild@vger.kernel.org,
        Fumiya Shigemitsu <shfy1014@gmail.com>,
        Yongxin Liu <yongxin.liu@windriver.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: allow modules to link *.a archives
Message-ID: <202001061302.XHfYnEBH%lkp@intel.com>
References: <20200106032324.3147-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="e4awreouzoqq7xbf"
Content-Disposition: inline
In-Reply-To: <20200106032324.3147-1-masahiroy@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--e4awreouzoqq7xbf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

I love your patch! Yet something to improve:

[auto build test ERROR on kbuild/for-next]
[also build test ERROR on v5.5-rc5 next-20191220]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Masahiro-Yamada/kbuild-allow-modules-to-link-a-archives/20200106-112554
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
config: x86_64-rhel (attached as .config)
compiler: gcc-7 (Debian 7.5.0-3) 7.5.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: net/tipc/socket.o: in function `tipc_nl_sk_walk':
>> net/tipc/socket.c:3449: multiple definition of `tipc_nl_sk_walk'; net/tipc/socket.o:net/tipc/socket.c:3449: first defined here
   ld: net/tipc/socket.o: in function `tipc_dump_start':
>> net/tipc/socket.c:3485: multiple definition of `tipc_dump_start'; net/tipc/socket.o:net/tipc/socket.c:3485: first defined here
   ld: net/tipc/socket.o: in function `tipc_dump_done':
>> net/tipc/socket.c:3509: multiple definition of `tipc_dump_done'; net/tipc/socket.o:net/tipc/socket.c:3509: first defined here
   ld: net/tipc/socket.o: in function `tipc_sk_fill_sock_diag':
>> net/tipc/socket.c:3521: multiple definition of `tipc_sk_fill_sock_diag'; net/tipc/socket.o:net/tipc/socket.c:3521: first defined here
   ld: net/tipc/socket.o: in function `tipc_sk_reinit':
>> net/tipc/socket.c:2858: multiple definition of `tipc_sk_reinit'; net/tipc/socket.o:net/tipc/socket.c:2858: first defined here
   ld: net/tipc/socket.o: in function `tipc_sk_rht_init':
>> net/tipc/socket.c:2946: multiple definition of `tipc_sk_rht_init'; net/tipc/socket.o:net/tipc/socket.c:2946: first defined here
   ld: net/tipc/socket.o: in function `tipc_sk_rht_destroy':
>> net/tipc/socket.c:2953: multiple definition of `tipc_sk_rht_destroy'; net/tipc/socket.o:net/tipc/socket.c:2953: first defined here
   ld: net/tipc/socket.o: in function `tipc_socket_init':
>> net/tipc/socket.c:3328: multiple definition of `tipc_socket_init'; net/tipc/socket.o:net/tipc/socket.c:3328: first defined here
   ld: net/tipc/socket.o: in function `tipc_socket_stop':
>> net/tipc/socket.c:3351: multiple definition of `tipc_socket_stop'; net/tipc/socket.o:net/tipc/socket.c:3351: first defined here
   ld: net/tipc/socket.o: in function `__tipc_dump_start':
>> net/tipc/socket.c:3491: multiple definition of `__tipc_dump_start'; net/tipc/socket.o:net/tipc/socket.c:3491: first defined here
   ld: net/tipc/socket.o: in function `tipc_nl_sk_dump':
>> net/tipc/socket.c:3588: multiple definition of `tipc_nl_sk_dump'; net/tipc/socket.o:net/tipc/socket.c:3588: first defined here
   ld: net/tipc/socket.o: in function `tipc_nl_publ_dump':
>> net/tipc/socket.c:3673: multiple definition of `tipc_nl_publ_dump'; net/tipc/socket.o:net/tipc/socket.c:3673: first defined here
   ld: net/tipc/socket.o: in function `tipc_sk_filtering':
>> net/tipc/socket.c:3732: multiple definition of `tipc_sk_filtering'; net/tipc/socket.o:net/tipc/socket.c:3732: first defined here
   ld: net/tipc/socket.o: in function `tipc_sk_rcv':
>> net/tipc/socket.c:2374: multiple definition of `tipc_sk_rcv'; net/tipc/socket.o:net/tipc/socket.c:2374: first defined here
   ld: net/tipc/socket.o: in function `tipc_sk_mcast_rcv':
>> net/tipc/socket.c:1163: multiple definition of `tipc_sk_mcast_rcv'; net/tipc/socket.o:net/tipc/socket.c:1163: first defined here
   ld: net/tipc/socket.o: in function `tipc_sock_get_portid':
>> net/tipc/socket.c:3782: multiple definition of `tipc_sock_get_portid'; net/tipc/socket.o:net/tipc/socket.c:3782: first defined here
   ld: net/tipc/socket.o: in function `tipc_sk_overlimit1':
>> net/tipc/socket.c:3796: multiple definition of `tipc_sk_overlimit1'; net/tipc/socket.o:net/tipc/socket.c:3796: first defined here
   ld: net/tipc/socket.o: in function `tipc_sk_overlimit2':
>> net/tipc/socket.c:3814: multiple definition of `tipc_sk_overlimit2'; net/tipc/socket.o:net/tipc/socket.c:3814: first defined here
   ld: net/tipc/socket.o: in function `tipc_sk_dump':
>> net/tipc/socket.c:3833: multiple definition of `tipc_sk_dump'; net/tipc/socket.o:net/tipc/socket.c:3833: first defined here

vim +3449 net/tipc/socket.c

b97bf3fd8f6a16 Per Liden                        2006-01-02  3321  
b97bf3fd8f6a16 Per Liden                        2006-01-02  3322  /**
4323add67792ce Per Liden                        2006-01-18  3323   * tipc_socket_init - initialize TIPC socket interface
b97bf3fd8f6a16 Per Liden                        2006-01-02  3324   *
b97bf3fd8f6a16 Per Liden                        2006-01-02  3325   * Returns 0 on success, errno otherwise
b97bf3fd8f6a16 Per Liden                        2006-01-02  3326   */
4323add67792ce Per Liden                        2006-01-18  3327  int tipc_socket_init(void)
b97bf3fd8f6a16 Per Liden                        2006-01-02 @3328  {
b97bf3fd8f6a16 Per Liden                        2006-01-02  3329  	int res;
b97bf3fd8f6a16 Per Liden                        2006-01-02  3330  
b97bf3fd8f6a16 Per Liden                        2006-01-02  3331  	res = proto_register(&tipc_proto, 1);
b97bf3fd8f6a16 Per Liden                        2006-01-02  3332  	if (res) {
2cf8aa19fe8bec Erik Hugne                       2012-06-29  3333  		pr_err("Failed to register TIPC protocol type\n");
b97bf3fd8f6a16 Per Liden                        2006-01-02  3334  		goto out;
b97bf3fd8f6a16 Per Liden                        2006-01-02  3335  	}
b97bf3fd8f6a16 Per Liden                        2006-01-02  3336  
b97bf3fd8f6a16 Per Liden                        2006-01-02  3337  	res = sock_register(&tipc_family_ops);
b97bf3fd8f6a16 Per Liden                        2006-01-02  3338  	if (res) {
2cf8aa19fe8bec Erik Hugne                       2012-06-29  3339  		pr_err("Failed to register TIPC socket type\n");
b97bf3fd8f6a16 Per Liden                        2006-01-02  3340  		proto_unregister(&tipc_proto);
b97bf3fd8f6a16 Per Liden                        2006-01-02  3341  		goto out;
b97bf3fd8f6a16 Per Liden                        2006-01-02  3342  	}
b97bf3fd8f6a16 Per Liden                        2006-01-02  3343   out:
b97bf3fd8f6a16 Per Liden                        2006-01-02  3344  	return res;
b97bf3fd8f6a16 Per Liden                        2006-01-02  3345  }
b97bf3fd8f6a16 Per Liden                        2006-01-02  3346  
b97bf3fd8f6a16 Per Liden                        2006-01-02  3347  /**
4323add67792ce Per Liden                        2006-01-18  3348   * tipc_socket_stop - stop TIPC socket interface
b97bf3fd8f6a16 Per Liden                        2006-01-02  3349   */
4323add67792ce Per Liden                        2006-01-18  3350  void tipc_socket_stop(void)
b97bf3fd8f6a16 Per Liden                        2006-01-02 @3351  {
b97bf3fd8f6a16 Per Liden                        2006-01-02  3352  	sock_unregister(tipc_family_ops.family);
b97bf3fd8f6a16 Per Liden                        2006-01-02  3353  	proto_unregister(&tipc_proto);
b97bf3fd8f6a16 Per Liden                        2006-01-02  3354  }
34b78a127c4fd5 Richard Alpe                     2014-11-20  3355  
34b78a127c4fd5 Richard Alpe                     2014-11-20  3356  /* Caller should hold socket lock for the passed tipc socket. */
d8182804cfd650 Richard Alpe                     2014-11-24  3357  static int __tipc_nl_add_sk_con(struct sk_buff *skb, struct tipc_sock *tsk)
34b78a127c4fd5 Richard Alpe                     2014-11-20  3358  {
34b78a127c4fd5 Richard Alpe                     2014-11-20  3359  	u32 peer_node;
34b78a127c4fd5 Richard Alpe                     2014-11-20  3360  	u32 peer_port;
34b78a127c4fd5 Richard Alpe                     2014-11-20  3361  	struct nlattr *nest;
34b78a127c4fd5 Richard Alpe                     2014-11-20  3362  
34b78a127c4fd5 Richard Alpe                     2014-11-20  3363  	peer_node = tsk_peer_node(tsk);
34b78a127c4fd5 Richard Alpe                     2014-11-20  3364  	peer_port = tsk_peer_port(tsk);
34b78a127c4fd5 Richard Alpe                     2014-11-20  3365  
ae0be8de9a53cd Michal Kubecek                   2019-04-26  3366  	nest = nla_nest_start_noflag(skb, TIPC_NLA_SOCK_CON);
517ccc2aa50dbd Kangjie Lu                       2019-03-16  3367  	if (!nest)
517ccc2aa50dbd Kangjie Lu                       2019-03-16  3368  		return -EMSGSIZE;
34b78a127c4fd5 Richard Alpe                     2014-11-20  3369  
34b78a127c4fd5 Richard Alpe                     2014-11-20  3370  	if (nla_put_u32(skb, TIPC_NLA_CON_NODE, peer_node))
34b78a127c4fd5 Richard Alpe                     2014-11-20  3371  		goto msg_full;
34b78a127c4fd5 Richard Alpe                     2014-11-20  3372  	if (nla_put_u32(skb, TIPC_NLA_CON_SOCK, peer_port))
34b78a127c4fd5 Richard Alpe                     2014-11-20  3373  		goto msg_full;
34b78a127c4fd5 Richard Alpe                     2014-11-20  3374  
34b78a127c4fd5 Richard Alpe                     2014-11-20  3375  	if (tsk->conn_type != 0) {
34b78a127c4fd5 Richard Alpe                     2014-11-20  3376  		if (nla_put_flag(skb, TIPC_NLA_CON_FLAG))
34b78a127c4fd5 Richard Alpe                     2014-11-20  3377  			goto msg_full;
34b78a127c4fd5 Richard Alpe                     2014-11-20  3378  		if (nla_put_u32(skb, TIPC_NLA_CON_TYPE, tsk->conn_type))
34b78a127c4fd5 Richard Alpe                     2014-11-20  3379  			goto msg_full;
34b78a127c4fd5 Richard Alpe                     2014-11-20  3380  		if (nla_put_u32(skb, TIPC_NLA_CON_INST, tsk->conn_instance))
34b78a127c4fd5 Richard Alpe                     2014-11-20  3381  			goto msg_full;
34b78a127c4fd5 Richard Alpe                     2014-11-20  3382  	}
34b78a127c4fd5 Richard Alpe                     2014-11-20  3383  	nla_nest_end(skb, nest);
34b78a127c4fd5 Richard Alpe                     2014-11-20  3384  
34b78a127c4fd5 Richard Alpe                     2014-11-20  3385  	return 0;
34b78a127c4fd5 Richard Alpe                     2014-11-20  3386  
34b78a127c4fd5 Richard Alpe                     2014-11-20  3387  msg_full:
34b78a127c4fd5 Richard Alpe                     2014-11-20  3388  	nla_nest_cancel(skb, nest);
34b78a127c4fd5 Richard Alpe                     2014-11-20  3389  
34b78a127c4fd5 Richard Alpe                     2014-11-20  3390  	return -EMSGSIZE;
34b78a127c4fd5 Richard Alpe                     2014-11-20  3391  }
34b78a127c4fd5 Richard Alpe                     2014-11-20  3392  
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3393  static int __tipc_nl_add_sk_info(struct sk_buff *skb, struct tipc_sock
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3394  			  *tsk)
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3395  {
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3396  	struct net *net = sock_net(skb->sk);
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3397  	struct sock *sk = &tsk->sk;
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3398  
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3399  	if (nla_put_u32(skb, TIPC_NLA_SOCK_REF, tsk->portid) ||
23fd3eace088ab Jon Maloy                        2018-03-22  3400  	    nla_put_u32(skb, TIPC_NLA_SOCK_ADDR, tipc_own_addr(net)))
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3401  		return -EMSGSIZE;
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3402  
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3403  	if (tipc_sk_connected(sk)) {
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3404  		if (__tipc_nl_add_sk_con(skb, tsk))
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3405  			return -EMSGSIZE;
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3406  	} else if (!list_empty(&tsk->publications)) {
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3407  		if (nla_put_flag(skb, TIPC_NLA_SOCK_HAS_PUBL))
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3408  			return -EMSGSIZE;
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3409  	}
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3410  	return 0;
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3411  }
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3412  
34b78a127c4fd5 Richard Alpe                     2014-11-20  3413  /* Caller should hold socket lock for the passed tipc socket. */
d8182804cfd650 Richard Alpe                     2014-11-24  3414  static int __tipc_nl_add_sk(struct sk_buff *skb, struct netlink_callback *cb,
34b78a127c4fd5 Richard Alpe                     2014-11-20  3415  			    struct tipc_sock *tsk)
34b78a127c4fd5 Richard Alpe                     2014-11-20  3416  {
34b78a127c4fd5 Richard Alpe                     2014-11-20  3417  	struct nlattr *attrs;
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3418  	void *hdr;
34b78a127c4fd5 Richard Alpe                     2014-11-20  3419  
34b78a127c4fd5 Richard Alpe                     2014-11-20  3420  	hdr = genlmsg_put(skb, NETLINK_CB(cb->skb).portid, cb->nlh->nlmsg_seq,
bfb3e5dd8dfd84 Richard Alpe                     2015-02-09  3421  			  &tipc_genl_family, NLM_F_MULTI, TIPC_NL_SOCK_GET);
34b78a127c4fd5 Richard Alpe                     2014-11-20  3422  	if (!hdr)
34b78a127c4fd5 Richard Alpe                     2014-11-20  3423  		goto msg_cancel;
34b78a127c4fd5 Richard Alpe                     2014-11-20  3424  
ae0be8de9a53cd Michal Kubecek                   2019-04-26  3425  	attrs = nla_nest_start_noflag(skb, TIPC_NLA_SOCK);
34b78a127c4fd5 Richard Alpe                     2014-11-20  3426  	if (!attrs)
34b78a127c4fd5 Richard Alpe                     2014-11-20  3427  		goto genlmsg_cancel;
34b78a127c4fd5 Richard Alpe                     2014-11-20  3428  
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3429  	if (__tipc_nl_add_sk_info(skb, tsk))
34b78a127c4fd5 Richard Alpe                     2014-11-20  3430  		goto attr_msg_cancel;
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3431  
34b78a127c4fd5 Richard Alpe                     2014-11-20  3432  	nla_nest_end(skb, attrs);
34b78a127c4fd5 Richard Alpe                     2014-11-20  3433  	genlmsg_end(skb, hdr);
34b78a127c4fd5 Richard Alpe                     2014-11-20  3434  
34b78a127c4fd5 Richard Alpe                     2014-11-20  3435  	return 0;
34b78a127c4fd5 Richard Alpe                     2014-11-20  3436  
34b78a127c4fd5 Richard Alpe                     2014-11-20  3437  attr_msg_cancel:
34b78a127c4fd5 Richard Alpe                     2014-11-20  3438  	nla_nest_cancel(skb, attrs);
34b78a127c4fd5 Richard Alpe                     2014-11-20  3439  genlmsg_cancel:
34b78a127c4fd5 Richard Alpe                     2014-11-20  3440  	genlmsg_cancel(skb, hdr);
34b78a127c4fd5 Richard Alpe                     2014-11-20  3441  msg_cancel:
34b78a127c4fd5 Richard Alpe                     2014-11-20  3442  	return -EMSGSIZE;
34b78a127c4fd5 Richard Alpe                     2014-11-20  3443  }
34b78a127c4fd5 Richard Alpe                     2014-11-20  3444  
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3445  int tipc_nl_sk_walk(struct sk_buff *skb, struct netlink_callback *cb,
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3446  		    int (*skb_handler)(struct sk_buff *skb,
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3447  				       struct netlink_callback *cb,
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3448  				       struct tipc_sock *tsk))
34b78a127c4fd5 Richard Alpe                     2014-11-20 @3449  {
8f5c5fcf353302 Cong Wang                        2018-09-04  3450  	struct rhashtable_iter *iter = (void *)cb->args[4];
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3451  	struct tipc_sock *tsk;
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3452  	int err;
34b78a127c4fd5 Richard Alpe                     2014-11-20  3453  
9a07efa9aea2f4 Cong Wang                        2018-08-24  3454  	rhashtable_walk_start(iter);
9a07efa9aea2f4 Cong Wang                        2018-08-24  3455  	while ((tsk = rhashtable_walk_next(iter)) != NULL) {
9a07efa9aea2f4 Cong Wang                        2018-08-24  3456  		if (IS_ERR(tsk)) {
9a07efa9aea2f4 Cong Wang                        2018-08-24  3457  			err = PTR_ERR(tsk);
9a07efa9aea2f4 Cong Wang                        2018-08-24  3458  			if (err == -EAGAIN) {
9a07efa9aea2f4 Cong Wang                        2018-08-24  3459  				err = 0;
d6e164e3215794 Richard Alpe                     2015-01-16  3460  				continue;
d6e164e3215794 Richard Alpe                     2015-01-16  3461  			}
9a07efa9aea2f4 Cong Wang                        2018-08-24  3462  			break;
9a07efa9aea2f4 Cong Wang                        2018-08-24  3463  		}
34b78a127c4fd5 Richard Alpe                     2014-11-20  3464  
9a07efa9aea2f4 Cong Wang                        2018-08-24  3465  		sock_hold(&tsk->sk);
9a07efa9aea2f4 Cong Wang                        2018-08-24  3466  		rhashtable_walk_stop(iter);
9a07efa9aea2f4 Cong Wang                        2018-08-24  3467  		lock_sock(&tsk->sk);
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3468  		err = skb_handler(skb, cb, tsk);
d6e164e3215794 Richard Alpe                     2015-01-16  3469  		if (err) {
9a07efa9aea2f4 Cong Wang                        2018-08-24  3470  			release_sock(&tsk->sk);
9a07efa9aea2f4 Cong Wang                        2018-08-24  3471  			sock_put(&tsk->sk);
d6e164e3215794 Richard Alpe                     2015-01-16  3472  			goto out;
34b78a127c4fd5 Richard Alpe                     2014-11-20  3473  		}
9a07efa9aea2f4 Cong Wang                        2018-08-24  3474  		release_sock(&tsk->sk);
9a07efa9aea2f4 Cong Wang                        2018-08-24  3475  		rhashtable_walk_start(iter);
9a07efa9aea2f4 Cong Wang                        2018-08-24  3476  		sock_put(&tsk->sk);
d6e164e3215794 Richard Alpe                     2015-01-16  3477  	}
9a07efa9aea2f4 Cong Wang                        2018-08-24  3478  	rhashtable_walk_stop(iter);
d6e164e3215794 Richard Alpe                     2015-01-16  3479  out:
34b78a127c4fd5 Richard Alpe                     2014-11-20  3480  	return skb->len;
34b78a127c4fd5 Richard Alpe                     2014-11-20  3481  }
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3482  EXPORT_SYMBOL(tipc_nl_sk_walk);
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3483  
9a07efa9aea2f4 Cong Wang                        2018-08-24  3484  int tipc_dump_start(struct netlink_callback *cb)
9a07efa9aea2f4 Cong Wang                        2018-08-24 @3485  {
8f5c5fcf353302 Cong Wang                        2018-09-04  3486  	return __tipc_dump_start(cb, sock_net(cb->skb->sk));
8f5c5fcf353302 Cong Wang                        2018-09-04  3487  }
8f5c5fcf353302 Cong Wang                        2018-09-04  3488  EXPORT_SYMBOL(tipc_dump_start);
8f5c5fcf353302 Cong Wang                        2018-09-04  3489  
8f5c5fcf353302 Cong Wang                        2018-09-04  3490  int __tipc_dump_start(struct netlink_callback *cb, struct net *net)
8f5c5fcf353302 Cong Wang                        2018-09-04 @3491  {
8f5c5fcf353302 Cong Wang                        2018-09-04  3492  	/* tipc_nl_name_table_dump() uses cb->args[0...3]. */
8f5c5fcf353302 Cong Wang                        2018-09-04  3493  	struct rhashtable_iter *iter = (void *)cb->args[4];
9a07efa9aea2f4 Cong Wang                        2018-08-24  3494  	struct tipc_net *tn = tipc_net(net);
9a07efa9aea2f4 Cong Wang                        2018-08-24  3495  
9a07efa9aea2f4 Cong Wang                        2018-08-24  3496  	if (!iter) {
9a07efa9aea2f4 Cong Wang                        2018-08-24  3497  		iter = kmalloc(sizeof(*iter), GFP_KERNEL);
9a07efa9aea2f4 Cong Wang                        2018-08-24  3498  		if (!iter)
9a07efa9aea2f4 Cong Wang                        2018-08-24  3499  			return -ENOMEM;
9a07efa9aea2f4 Cong Wang                        2018-08-24  3500  
8f5c5fcf353302 Cong Wang                        2018-09-04  3501  		cb->args[4] = (long)iter;
9a07efa9aea2f4 Cong Wang                        2018-08-24  3502  	}
9a07efa9aea2f4 Cong Wang                        2018-08-24  3503  
9a07efa9aea2f4 Cong Wang                        2018-08-24  3504  	rhashtable_walk_enter(&tn->sk_rht, iter);
9a07efa9aea2f4 Cong Wang                        2018-08-24  3505  	return 0;
9a07efa9aea2f4 Cong Wang                        2018-08-24  3506  }
9a07efa9aea2f4 Cong Wang                        2018-08-24  3507  
9a07efa9aea2f4 Cong Wang                        2018-08-24  3508  int tipc_dump_done(struct netlink_callback *cb)
9a07efa9aea2f4 Cong Wang                        2018-08-24 @3509  {
8f5c5fcf353302 Cong Wang                        2018-09-04  3510  	struct rhashtable_iter *hti = (void *)cb->args[4];
9a07efa9aea2f4 Cong Wang                        2018-08-24  3511  
9a07efa9aea2f4 Cong Wang                        2018-08-24  3512  	rhashtable_walk_exit(hti);
9a07efa9aea2f4 Cong Wang                        2018-08-24  3513  	kfree(hti);
9a07efa9aea2f4 Cong Wang                        2018-08-24  3514  	return 0;
9a07efa9aea2f4 Cong Wang                        2018-08-24  3515  }
9a07efa9aea2f4 Cong Wang                        2018-08-24  3516  EXPORT_SYMBOL(tipc_dump_done);
9a07efa9aea2f4 Cong Wang                        2018-08-24  3517  
e41f0548473eb7 Cong Wang                        2018-04-06  3518  int tipc_sk_fill_sock_diag(struct sk_buff *skb, struct netlink_callback *cb,
e41f0548473eb7 Cong Wang                        2018-04-06  3519  			   struct tipc_sock *tsk, u32 sk_filter_state,
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3520  			   u64 (*tipc_diag_gen_cookie)(struct sock *sk))
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21 @3521  {
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3522  	struct sock *sk = &tsk->sk;
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3523  	struct nlattr *attrs;
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3524  	struct nlattr *stat;
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3525  
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3526  	/*filter response w.r.t sk_state*/
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3527  	if (!(sk_filter_state & (1 << sk->sk_state)))
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3528  		return 0;
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3529  
ae0be8de9a53cd Michal Kubecek                   2019-04-26  3530  	attrs = nla_nest_start_noflag(skb, TIPC_NLA_SOCK);
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3531  	if (!attrs)
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3532  		goto msg_cancel;
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3533  
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3534  	if (__tipc_nl_add_sk_info(skb, tsk))
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3535  		goto attr_msg_cancel;
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3536  
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3537  	if (nla_put_u32(skb, TIPC_NLA_SOCK_TYPE, (u32)sk->sk_type) ||
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3538  	    nla_put_u32(skb, TIPC_NLA_SOCK_TIPC_STATE, (u32)sk->sk_state) ||
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3539  	    nla_put_u32(skb, TIPC_NLA_SOCK_INO, sock_i_ino(sk)) ||
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3540  	    nla_put_u32(skb, TIPC_NLA_SOCK_UID,
e41f0548473eb7 Cong Wang                        2018-04-06  3541  			from_kuid_munged(sk_user_ns(NETLINK_CB(cb->skb).sk),
4b2e6877b8793b GhantaKrishnamurthy MohanKrishna 2018-04-04  3542  					 sock_i_uid(sk))) ||
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3543  	    nla_put_u64_64bit(skb, TIPC_NLA_SOCK_COOKIE,
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3544  			      tipc_diag_gen_cookie(sk),
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3545  			      TIPC_NLA_SOCK_PAD))
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3546  		goto attr_msg_cancel;
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3547  
ae0be8de9a53cd Michal Kubecek                   2019-04-26  3548  	stat = nla_nest_start_noflag(skb, TIPC_NLA_SOCK_STAT);
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3549  	if (!stat)
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3550  		goto attr_msg_cancel;
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3551  
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3552  	if (nla_put_u32(skb, TIPC_NLA_SOCK_STAT_RCVQ,
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3553  			skb_queue_len(&sk->sk_receive_queue)) ||
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3554  	    nla_put_u32(skb, TIPC_NLA_SOCK_STAT_SENDQ,
872619d8cf810c GhantaKrishnamurthy MohanKrishna 2018-03-21  3555  			skb_queue_len(&sk->sk_write_queue)) ||
872619d8cf810c GhantaKrishnamurthy MohanKrishna 2018-03-21  3556  	    nla_put_u32(skb, TIPC_NLA_SOCK_STAT_DROP,
872619d8cf810c GhantaKrishnamurthy MohanKrishna 2018-03-21  3557  			atomic_read(&sk->sk_drops)))
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3558  		goto stat_msg_cancel;
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3559  
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3560  	if (tsk->cong_link_cnt &&
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3561  	    nla_put_flag(skb, TIPC_NLA_SOCK_STAT_LINK_CONG))
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3562  		goto stat_msg_cancel;
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3563  
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3564  	if (tsk_conn_cong(tsk) &&
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3565  	    nla_put_flag(skb, TIPC_NLA_SOCK_STAT_CONN_CONG))
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3566  		goto stat_msg_cancel;
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3567  
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3568  	nla_nest_end(skb, stat);
a1be5a20f137bd GhantaKrishnamurthy MohanKrishna 2018-06-29  3569  
a1be5a20f137bd GhantaKrishnamurthy MohanKrishna 2018-06-29  3570  	if (tsk->group)
a1be5a20f137bd GhantaKrishnamurthy MohanKrishna 2018-06-29  3571  		if (tipc_group_fill_sock_diag(tsk->group, skb))
a1be5a20f137bd GhantaKrishnamurthy MohanKrishna 2018-06-29  3572  			goto stat_msg_cancel;
a1be5a20f137bd GhantaKrishnamurthy MohanKrishna 2018-06-29  3573  
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3574  	nla_nest_end(skb, attrs);
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3575  
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3576  	return 0;
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3577  
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3578  stat_msg_cancel:
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3579  	nla_nest_cancel(skb, stat);
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3580  attr_msg_cancel:
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3581  	nla_nest_cancel(skb, attrs);
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3582  msg_cancel:
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3583  	return -EMSGSIZE;
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3584  }
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3585  EXPORT_SYMBOL(tipc_sk_fill_sock_diag);
1a1a143daf84db Richard Alpe                     2014-11-20  3586  
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3587  int tipc_nl_sk_dump(struct sk_buff *skb, struct netlink_callback *cb)
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21 @3588  {
c30b70deb5f486 GhantaKrishnamurthy MohanKrishna 2018-03-21  3589  	return tipc_nl_sk_walk(skb, cb, __tipc_nl_add_sk);
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3590  }
dfde331e757fd7 GhantaKrishnamurthy MohanKrishna 2018-03-21  3591  

:::::: The code at line 3449 was first introduced by commit
:::::: 34b78a127c4fd57cf3d5c64031693d10a8e0fae1 tipc: add sock dump to new netlink api

:::::: TO: Richard Alpe <richard.alpe@ericsson.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--e4awreouzoqq7xbf
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
5CIsD4Chw5UOJJuNJ5xg39kQVvLG2Yd40/DFPsSx9SQLN0jo9xVjK9FKmkFCqx46iSe1uUFC
6xE6yTV9X2PsPE8Y337Ur9eeuKTDZC9Xm69IMDXiOAlu9uX4ClCcYnx8YVfNZ57Qrn09vFhf
U/mXJN+fY8yEztW9Xz+Yjtnl586YL+YLgvsoeLM/WmbpZqPXYzsN98c1J+pWmL5u0+JrtLU8
zYXLSWDdzPU0lBp8NSP2OsJXJAdFhr9ZNVuWxqSrqUa3XpKjNl9Oly5cVDezdcU21DfT5aba
ULFSdIIFwZoQvrom4CK9mlOtC26Xmyk1H8WKT4lxwmnqU55dXv6D+tkXTGlbwV8WB+6duoXM
E07PcJiywY2gr3aAeq4XgcANMI9B5KJsZwSYR1gbNljen2VRIkysvGHWvo2msiWD0dyFHkPm
1oUE0J4AZy1BzipfFTIU6x6raNJdSr+dDDTEIgmP2HhuBV1socOUdmSWTTmAI1/TWhwWIT3l
RI1VGtFmQFi1ausniT89nl8+tEli4i7jTXVqKxkmwsrJ1c9lUzLpTNRVGdRb17FEVorP0Vqs
iKOEGq/cbXGy2xLVp7mhvaOsz/d9qk+dBYkRPWG5XG8ooeRGwFbRhEL1W0a2+3X692K9sRCW
Jwnfsh1yvqVmizzAYLyq6Ne5FqsnTnHYeRyjwQ3Z+dYKTiV+ICkws5p06kya3ONOp5NQurGG
l9fe+lg5H+5mzLDWjPOGx1sTUCD72UVZXN4ab5yACjG/mELRVTdMj5WIABGVPBcL6xM81oLq
GJ/Iosrz3I/lytoTIxSx6Ra4tRe7P1DxoFuCwxYo4jxNa/nyqLFwiQF+d7sNTaDecEmU5bIC
X+2F+cbUwTCY7EiRJk2ZFs2oBwNDPFHgneGpIuEpnb8PutQEdwW+maQsYzvT2xM5fBfnkmqe
TM+jNUCl60mjrHaAhk35AGsvoozmtkg6C1+LDTCukSlKtRgZ7Iec/655Vnqw1snu4e3yfvnz
Y7L/fD2//ecw+f7z/P5BBE7p4tQbv+24sy20ruJEOLRd2zWfy68+L9t4Or94g1JjTBhiTDQw
vq7l5V2zz6siIe9YkFjeJ8p0hMIN6IoEMtHioeJ77UVIfYXfYPIunXgrTBq0RWBVizFqxVsj
NTrSXNzAwX9oxNRFvLG7t8u8l7USXbJMhiBuZCSsr+hQcLHp+oMvzqskQGqzgbCMsf5uBJ7N
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
AA==

--e4awreouzoqq7xbf--
